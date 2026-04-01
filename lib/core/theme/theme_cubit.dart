import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/storage/local_storage_service.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  final LocalStorageService _storage;

  static const _key = 'theme_mode';

  ThemeCubit(LocalStorageService storage)
    : _storage = storage,
      super(_resolve(storage));

  static ThemeMode _resolve(LocalStorageService storage) {
    switch (storage.getString(_key)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void toggleTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final next = isDark ? ThemeMode.light : ThemeMode.dark;
    _storage.setString(_key, next == ThemeMode.dark ? 'dark' : 'light');
    emit(next);
  }
}
