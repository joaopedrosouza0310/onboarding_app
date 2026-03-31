import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';

abstract class PlacesRepository {
  Future<Result<List<AddressSuggestionEntity>>> searchSuggestions(String query);
  Future<Result<AddressEntity>> getAddressDetails(String placeId);
}
