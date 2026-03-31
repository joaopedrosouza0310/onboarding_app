import 'package:injectable/injectable.dart';

abstract class AnalyticsService {
  Future<void> initialize();
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  });
  Future<void> logScreenView({required String screenName, String? screenClass});
  Future<void> setUserId(String? userId);
  Future<void> setUserProperty({required String name, required String? value});
}

@Singleton(as: AnalyticsService)
class AnalyticsServiceImpl implements AnalyticsService {
  // TODO: Replace with FirebaseAnalytics.instance once Firebase is configured
  // final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future<void> initialize() async {
    // Analytics is initialized when Firebase is initialized
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    // await _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    // await _analytics.logScreenView(
    //   screenName: screenName,
    //   screenClass: screenClass,
    // );
  }

  @override
  Future<void> setUserId(String? userId) async {
    // await _analytics.setUserId(id: userId);
  }

  @override
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    // await _analytics.setUserProperty(name: name, value: value);
  }
}
