import 'package:onboarding_app/core/error/app_exception.dart';
import 'package:onboarding_app/core/result/result.dart';

AppFailure mapExceptionToFailure(AppException exception) {
  return switch (exception) {
    ServerException() => AppFailure.server(
      message: exception.message,
      statusCode: exception.statusCode,
    ),
    NetworkException() => AppFailure.network(message: exception.message),
    CacheException() => AppFailure.cache(message: exception.message),
    AuthException() ||
    UnauthorizedException() => AppFailure.auth(message: exception.message),
    _ => AppFailure.unknown(message: exception.message),
  };
}
