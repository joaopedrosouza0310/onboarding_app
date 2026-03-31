class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() =>
      'AppException(message: $message, statusCode: $statusCode)';
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.statusCode,
    super.originalError,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection',
    super.originalError,
  });
}

class CacheException extends AppException {
  const CacheException({super.message = 'Cache error', super.originalError});
}

class AuthException extends AppException {
  const AuthException({
    super.message = 'Authentication error',
    super.originalError,
  });
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    super.message = 'Unauthorized',
    super.statusCode = 401,
    super.originalError,
  });
}
