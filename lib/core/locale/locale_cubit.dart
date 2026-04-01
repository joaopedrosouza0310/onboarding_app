import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/storage/local_storage_service.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  final LocalStorageService _storage;
  static const _key = 'locale_code';

  LocaleCubit(LocalStorageService storage)
    : _storage = storage,
      super(_resolve(storage));

  static Locale _resolve(LocalStorageService storage) {
    final localeCode = storage.getString(_key);
    if (localeCode != null && localeCode.isNotEmpty) {
      return Locale(localeCode);
    }
    return const Locale('en');
  }

  void setLocale(Locale locale) {
    _storage.setString(_key, locale.languageCode);
    emit(locale);
  }
}
