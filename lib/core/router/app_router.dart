import 'package:go_router/go_router.dart';
import 'package:onboarding_app/core/router/app_routes.dart';
import 'package:onboarding_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:onboarding_app/features/splash/presentation/pages/splash_page.dart';
import 'package:onboarding_app/features/success/presentation/pages/success_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.success,
        name: AppRouteNames.success,
        builder: (context, state) => const SuccessPage(),
      ),
    ],
  );
}
