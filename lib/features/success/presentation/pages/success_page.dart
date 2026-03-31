import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_app/core/di/injection.dart';
import 'package:onboarding_app/core/extensions/context_extensions.dart';
import 'package:onboarding_app/core/router/app_routes.dart';
import 'package:onboarding_app/core/widgets/material_spacing.dart';
import 'package:onboarding_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:onboarding_app/gen/assets.gen.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Assets.images.keeperLogo.svg(width: 180),
              ),
              MaterialSpacing(height: 5),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 44,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
              MaterialSpacing(height: 4),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  "You're all set!",
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialSpacing.heightDefault(),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Your profile has been successfully set up.\nWelcome aboard!',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    getIt<OnboardingCubit>().reset();
                    context.go(AppRoutes.splash);
                  },
                  child: const Text('Get Started'),
                ),
              ),
              MaterialSpacing.heightDefault(),
            ],
          ),
        ),
      ),
    );
  }
}
