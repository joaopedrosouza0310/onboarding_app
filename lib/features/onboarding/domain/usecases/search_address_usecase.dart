import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/core/usecase/usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/places_repository.dart';

@injectable
class SearchAddressUseCase implements UseCase<List<AddressSuggestionEntity>, String> {
  final PlacesRepository _repository;

  const SearchAddressUseCase(this._repository);

  @override
  Future<Result<List<AddressSuggestionEntity>>> call(String params) {
    return _repository.searchSuggestions(params);
  }
}
