import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_app/features/onboarding/data/mappers/places_mapper.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_details_model.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_suggestion_model.dart';

void main() {
  group('PlacesMapper', () {
    group('toSuggestionEntity', () {
      test('maps placeId and description correctly', () {
        // Arrange
        const model = PlaceSuggestionModel(
          placeId: 'place_001',
          description: '123 Main St, San Francisco, CA, USA',
        );

        // Act
        final entity = PlacesMapper.toSuggestionEntity(model);

        // Assert
        expect(entity.placeId, 'place_001');
        expect(entity.description, '123 Main St, San Francisco, CA, USA');
      });
    });

    group('toAddressEntity', () {
      test('parses US address components correctly', () {
        // Arrange
        const model = PlaceDetailsModel(
          formattedAddress: '123 Main Street, San Francisco, CA 94105, USA',
          addressComponents: [
            AddressComponentModel(
              longName: '123',
              shortName: '123',
              types: ['street_number'],
            ),
            AddressComponentModel(
              longName: 'Main Street',
              shortName: 'Main St',
              types: ['route'],
            ),
            AddressComponentModel(
              longName: 'San Francisco',
              shortName: 'SF',
              types: ['locality', 'political'],
            ),
            AddressComponentModel(
              longName: 'California',
              shortName: 'CA',
              types: ['administrative_area_level_1', 'political'],
            ),
            AddressComponentModel(
              longName: '94105',
              shortName: '94105',
              types: ['postal_code'],
            ),
            AddressComponentModel(
              longName: 'United States',
              shortName: 'US',
              types: ['country', 'political'],
            ),
          ],
        );

        // Act
        final entity = PlacesMapper.toAddressEntity(model);

        // Assert
        expect(entity.streetAddress, '123 Main Street');
        expect(entity.city, 'San Francisco');
        expect(entity.addressState, 'California');
        expect(entity.postalCode, '94105');
        expect(entity.country, 'United States');
      });

      test('uses route alone when street number is absent', () {
        // Arrange
        const model = PlaceDetailsModel(
          formattedAddress: 'Broadway, New York, NY, USA',
          addressComponents: [
            AddressComponentModel(
              longName: 'Broadway',
              shortName: 'Broadway',
              types: ['route'],
            ),
            AddressComponentModel(
              longName: 'New York',
              shortName: 'NYC',
              types: ['locality'],
            ),
            AddressComponentModel(
              longName: 'New York',
              shortName: 'NY',
              types: ['administrative_area_level_1'],
            ),
            AddressComponentModel(
              longName: 'United States',
              shortName: 'US',
              types: ['country'],
            ),
          ],
        );

        // Act
        final entity = PlacesMapper.toAddressEntity(model);

        // Assert
        expect(entity.streetAddress, 'Broadway');
        expect(entity.city, 'New York');
      });
    });
  });
}
