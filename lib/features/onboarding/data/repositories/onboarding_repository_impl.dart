import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/onboarding_repository.dart';

/// In-memory implementation — no backend for onboarding submission.
@Singleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl();

  @override
  Future<Result<bool>> submit(OnboardingDataEntity data) async {
    // Simulated async submission — replace with real API call when ready.
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return const Result.success(true);
  }
}
