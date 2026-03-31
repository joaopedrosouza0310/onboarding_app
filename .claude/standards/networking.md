# Networking & Auth Refresh Standards

## Architecture

```
core/network/
├── dio_client.dart                    # Dio factory with base config
├── network_error_mapper.dart          # DioException → AppException mapping
└── interceptors/
    ├── auth_interceptor.dart          # Token injection + refresh
    └── logging_interceptor.dart       # Request/response logging
```

## Dio Client

`DioClient.createDio()` creates the singleton Dio instance with:
- Base URL from `ApiConstants`
- Connect/receive/send timeouts
- Default JSON headers
- Interceptor chain: Auth → Logging

## Auth Interceptor

`AuthInterceptor` extends `QueuedInterceptor` to serialize concurrent 401 handling.

### Request Phase
1. Read access token from `SecureStorageService`
2. Attach `Authorization: Bearer <token>` header

### Error Phase (401 handling)
1. Extract refresh token from `SecureStorageService`
2. Call `/auth/refresh` using a **separate Dio instance** (avoids interceptor loops)
3. On success: store new tokens, retry the original request
4. On failure: clear all tokens, propagate error (UI should redirect to login)

### Key Design Decisions
- **QueuedInterceptor** — serializes requests so multiple 401s don't trigger parallel refreshes
- **Separate Dio instance for refresh** — prevents the refresh request itself from triggering the auth interceptor
- **Clear tokens on refresh failure** — ensures clean state

## Error Mapping

`NetworkErrorMapper.mapDioException()` converts `DioException` types to `AppException` hierarchy:

| DioExceptionType | AppException |
|-----------------|--------------|
| connectionTimeout / sendTimeout / receiveTimeout | `NetworkException` |
| connectionError | `NetworkException` |
| badResponse 401 | `UnauthorizedException` |
| badResponse 403 | `AuthException` |
| badResponse 4xx/5xx | `ServerException` |
| cancel | `AppException` |
| other | `ServerException` |

## Datasource Usage

Datasources catch `DioException` and rethrow as `AppException`:

```dart
@override
Future<LoginResponse> login(LoginRequest request) async {
  try {
    final response = await _dio.post('/auth/login', data: request.toJson());
    return LoginResponse.fromJson(response.data);
  } on DioException catch (e) {
    throw NetworkErrorMapper.mapDioException(e);
  } catch (e) {
    throw ServerException(message: e.toString());
  }
}
```

Repositories catch `AppException` and return `Result.failure`:

```dart
try {
  final response = await _datasource.login(request);
  return Result.success(LoginMapper.toEntity(response.user));
} on AppException catch (e) {
  return Result.failure(mapExceptionToFailure(e));
}
```
