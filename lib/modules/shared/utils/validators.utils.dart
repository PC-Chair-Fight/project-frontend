class UtilValidators {
  UtilValidators._() {}

  /// Starts a chain of validators; to obtain the final answer,
  /// use [UtilValidator.message]
  static UtilValidator guard(String? value) {
    return UtilValidator._(value, null);
  }
}

/// Part of a chain of validators (started by [UtilValidators.guard]);
/// the message of the first encountered error will be returned by
/// all following validators in the chain
class UtilValidator {
  String? _value;
  String? _message;

  UtilValidator._(this._value, this._message);

  // this receives a function so that it can be called here
  // when we already checked that _value is not null,
  // to avoid checking this everywhere else
  UtilValidator _currentMessageOr(
      String message, bool Function(String) valueIsValid) {
    if (_message != null) return UtilValidator._(null, _message);
    if (_value != null && valueIsValid(_value!))
      return UtilValidator._(_value, null);
    return UtilValidator._(null, message);
  }

  String? get message => _message;

  UtilValidator required(String message) =>
      _currentMessageOr(message, (val) => !val.isEmpty);

  UtilValidator atLeast(int noChars, String message) =>
      _currentMessageOr(message, (val) => val.length >= noChars);

  UtilValidator contains(String chars, int howMany, String message) =>
      _currentMessageOr(
          message,
          (val) =>
              chars.runes
                  .map((testRune) => val.runes
                      .where((valueRune) => valueRune == testRune)
                      .length)
                  .reduce((a, b) => a + b) >=
              howMany);

  UtilValidator equal(String? other, String message) =>
      _currentMessageOr(message, (val) => val == other);
}
