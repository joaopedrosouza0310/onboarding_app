import 'package:injectable/injectable.dart';

abstract class CrashlyticsService {
  Future<void> initialize();
  Future<void> logError(dynamic exception, StackTrace? stackTrace);
  Future<void> logNonFatalError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
  });
  Future<void> log(String message);
  Future<void> setUserId(String userId);
  Future<void> setCustomKey(String key, dynamic value);
}

@Singleton(as: CrashlyticsService)
class CrashlyticsServiceImpl implements CrashlyticsService {
  // TODO: Replace with FirebaseCrashlytics.instance once Firebase is configured
  // final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  Future<void> initialize() async {
    // await _crashlytics.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = _crashlytics.recordFlutterFatalError;
  }

  @override
  Future<void> logError(dynamic exception, StackTrace? stackTrace) async {
    // await _crashlytics.recordError(exception, stackTrace, fatal: true);
  }

  @override
  Future<void> logNonFatalError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
  }) async {
    // await _crashlytics.recordError(
    //   exception,
    //   stackTrace,
    //   reason: reason ?? 'Non-fatal error',
    //   fatal: false,
    // );
  }

  @override
  Future<void> log(String message) async {
    // await _crashlytics.log(message);
  }

  @override
  Future<void> setUserId(String userId) async {
    // await _crashlytics.setUserIdentifier(userId);
  }

  @override
  Future<void> setCustomKey(String key, dynamic value) async {
    // await _crashlytics.setCustomKey(key, value);
  }
}
