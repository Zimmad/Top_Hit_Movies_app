class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message ';
  }
}

class FetchDataException extends AppException {
  FetchDataException([final message])
      : super(message, ' Error during commuication');
}

class BadRequestException extends AppException {
  BadRequestException([final message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([final message])
      : super([message, 'Unauthorised request']);
}

// class SuperOtherFormat extends AppException {
//   SuperOtherFormat([super._message, super._prefix = 'Valid Super Message']) {}
// }
