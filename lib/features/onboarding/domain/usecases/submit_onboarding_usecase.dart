import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/core/usecase/usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/onboarding_repository.dart';

@injectable
class SubmitOnboardingUseCase implements UseCase<bool, OnboardingDataEntity> {
  final OnboardingRepository _repository;

  const SubmitOnboardingUseCase(this._repository);

  @override
  Future<Result<bool>> call(OnboardingDataEntity params) {
    return _repository.submit(params);
  }
}
