class UtilValidators {
  static String? required(value, message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}
