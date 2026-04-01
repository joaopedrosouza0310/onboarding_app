import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.example.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
}

class StorageKeys {
  StorageKeys._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String themeMode = 'theme_mode';
  static const String isFirstLaunch = 'is_first_launch';
  static const String userId = 'user_id';
}

/// Read from the `.env` file at runtime via flutter_dotenv.
/// If the key is absent or empty, autocomplete falls back to manual entry.
/// Load order: dotenv.load() in main.dart must run before this is accessed.
class PlacesApiConstants {
  PlacesApiConstants._();

  static String get apiKey => dotenv.env['GOOGLE_PLACES_API_KEY'] ?? '';
}

class OnboardingConstants {
  OnboardingConstants._();

  /// Minimum age to complete onboarding (product decision: 18+).
  static const int minimumAge = 18;

  /// Upper bound for a realistic date of birth.
  static const int maximumAge = 120;

  /// Where the DOB date picker opens by default (years ago from today).
  static const int defaultPickerYearsAgo = 25;
}
