import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';

abstract class OnboardingRepository {
  Future<Result<bool>> submit(OnboardingDataEntity data);
}
