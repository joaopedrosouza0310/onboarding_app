import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/constants/app_constants.dart';

abstract class SecureStorageService {
  Future<String?> getAccessToken();
  Future<void> setAccessToken(String token);
  Future<String?> getRefreshToken();
  Future<void> setRefreshToken(String token);
  Future<void> clearTokens();
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
  Future<void> deleteAll();
}

@Singleton(as: SecureStorageService)
class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _storage;

  const SecureStorageServiceImpl(this._storage);

  @override
  Future<String?> getAccessToken() => read(StorageKeys.accessToken);

  @override
  Future<void> setAccessToken(String token) =>
      write(StorageKeys.accessToken, token);

  @override
  Future<String?> getRefreshToken() => read(StorageKeys.refreshToken);

  @override
  Future<void> setRefreshToken(String token) =>
      write(StorageKeys.refreshToken, token);

  @override
  Future<void> clearTokens() async {
    await delete(StorageKeys.accessToken);
    await delete(StorageKeys.refreshToken);
  }

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();
}
