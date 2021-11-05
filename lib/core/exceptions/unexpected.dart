
class UnexpectedException implements Exception {

  String _message = '';

  UnexpectedException([String message = 'An unexpected error occurred']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}