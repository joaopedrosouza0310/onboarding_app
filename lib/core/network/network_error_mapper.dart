import 'package:dio/dio.dart';
import 'package:onboarding_app/core/error/app_exception.dart';

class NetworkErrorMapper {
  NetworkErrorMapper._();

  static AppException mapDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const NetworkException(
        message: 'Connection timed out',
      ),
      DioExceptionType.connectionError => const NetworkException(
        message: 'No internet connection',
      ),
      DioExceptionType.badResponse => _mapStatusCode(exception),
      DioExceptionType.cancel => const AppException(
        message: 'Request was cancelled',
      ),
      _ => ServerException(
        message: exception.message ?? 'An unexpected error occurred',
        originalError: exception,
      ),
    };
  }

  static AppException _mapStatusCode(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final data = exception.response?.data;
    final message = data is Map<String, dynamic>
        ? (data['message'] as String?) ?? 'Server error'
        : 'Server error';

    return switch (statusCode) {
      400 => ServerException(message: message, statusCode: 400),
      401 => UnauthorizedException(message: message, originalError: exception),
      403 => AuthException(
        message: 'Access forbidden',
        originalError: exception,
      ),
      404 => ServerException(message: 'Resource not found', statusCode: 404),
      409 => ServerException(message: message, statusCode: 409),
      422 => ServerException(message: message, statusCode: 422),
      500 => ServerException(message: 'Internal server error', statusCode: 500),
      502 => ServerException(message: 'Bad gateway', statusCode: 502),
      503 => ServerException(message: 'Service unavailable', statusCode: 503),
      _ => ServerException(
        message: message,
        statusCode: statusCode,
        originalError: exception,
      ),
    };
  }
}
