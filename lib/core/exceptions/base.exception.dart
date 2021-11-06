class BaseException implements Exception {
  String _message = '';

  BaseException([String message = 'An unexpected error occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
