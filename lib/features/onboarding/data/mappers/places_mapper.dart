import 'package:onboarding_app/features/onboarding/data/models/place_details_model.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_suggestion_model.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';

class PlacesMapper {
  PlacesMapper._();

  static AddressSuggestionEntity toSuggestionEntity(
    PlaceSuggestionModel model,
  ) {
    return AddressSuggestionEntity(
      placeId: model.placeId,
      description: model.description,
    );
  }

  static AddressEntity toAddressEntity(PlaceDetailsModel model) {
    String streetNumber = '';
    String route = '';
    String city = '';
    String addressState = '';
    String postalCode = '';
    String country = '';

    for (final component in model.addressComponents) {
      if (component.types.contains('street_number')) {
        streetNumber = component.longName;
      } else if (component.types.contains('route')) {
        route = component.longName;
      } else if (component.types.contains('locality') ||
          component.types.contains('postal_town')) {
        city = component.longName;
      } else if (component.types.contains('administrative_area_level_1')) {
        addressState = component.longName;
      } else if (component.types.contains('postal_code')) {
        postalCode = component.longName;
      } else if (component.types.contains('country')) {
        country = component.longName;
      }
    }

    final street = streetNumber.isEmpty ? route : '$streetNumber $route';
    return AddressEntity(
      streetAddress: street,
      city: city,
      addressState: addressState,
      postalCode: postalCode,
      country: country,
    );
  }
}
