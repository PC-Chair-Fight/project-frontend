
class UnauthorizedException implements Exception {

  String _message = '';

  UnauthorizedException([String message = 'Unauthorized for that action']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}