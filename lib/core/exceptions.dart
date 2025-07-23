class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() => '$prefix: $message';
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No Internet');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Forbidden');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not Found');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized');
}
