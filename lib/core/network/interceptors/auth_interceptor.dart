import 'package:dio/dio.dart';
import 'package:onboarding_app/core/constants/app_constants.dart';
import 'package:onboarding_app/core/di/injection.dart';
import 'package:onboarding_app/core/storage/secure_storage_service.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final secureStorage = getIt<SecureStorageService>();
    final accessToken = await secureStorage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final newAccessToken = await _refreshToken();
        if (newAccessToken != null) {
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';

          final response = await _dio.fetch(err.requestOptions);
          return handler.resolve(response);
        }
      } catch (_) {
        // Refresh failed — clear tokens and propagate error
        final secureStorage = getIt<SecureStorageService>();
        await secureStorage.clearTokens();
      }
    }
    handler.next(err);
  }

  Future<String?> _refreshToken() async {
    final secureStorage = getIt<SecureStorageService>();
    final refreshToken = await secureStorage.getRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) return null;

    try {
      // Use a separate Dio instance to avoid interceptor loops
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final response = await refreshDio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newAccessToken = response.data['access_token'] as String?;
      final newRefreshToken = response.data['refresh_token'] as String?;

      if (newAccessToken != null) {
        await secureStorage.setAccessToken(newAccessToken);
        if (newRefreshToken != null) {
          await secureStorage.setRefreshToken(newRefreshToken);
        }
        return newAccessToken;
      }
    } catch (_) {
      // Refresh request failed
    }

    return null;
  }
}
