import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/core/usecase/usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/places_repository.dart';

@injectable
class GetAddressDetailsUseCase implements UseCase<AddressEntity, String> {
  final PlacesRepository _repository;

  const GetAddressDetailsUseCase(this._repository);

  @override
  Future<Result<AddressEntity>> call(String params) {
    return _repository.getAddressDetails(params);
  }
}
