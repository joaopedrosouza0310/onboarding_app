import 'package:dio/dio.dart';
import 'package:onboarding_app/core/constants/app_constants.dart';
import 'package:onboarding_app/core/network/interceptors/auth_interceptor.dart';
import 'package:onboarding_app/core/network/interceptors/logging_interceptor.dart';

class DioClient {
  DioClient._();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([AuthInterceptor(dio), LoggingInterceptor()]);

    return dio;
  }
}
