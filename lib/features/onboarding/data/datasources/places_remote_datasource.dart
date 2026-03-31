import 'package:onboarding_app/features/onboarding/data/models/place_details_model.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_suggestion_model.dart';

abstract class PlacesRemoteDatasource {
  Future<List<PlaceSuggestionModel>> searchSuggestions(String query);
  Future<PlaceDetailsModel> getPlaceDetails(String placeId);
}
