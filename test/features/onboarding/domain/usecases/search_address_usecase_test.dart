import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/places_repository.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/search_address_usecase.dart';

class MockPlacesRepository extends Mock implements PlacesRepository {}

void main() {
  late SearchAddressUseCase useCase;
  late MockPlacesRepository mockRepository;

  const tSuggestions = [
    AddressSuggestionEntity(
      placeId: 'abc123',
      description: '123 Main St, San Francisco, CA, USA',
    ),
  ];

  setUp(() {
    mockRepository = MockPlacesRepository();
    useCase = SearchAddressUseCase(mockRepository);
  });

  group('SearchAddressUseCase', () {
    test('returns suggestion list on success', () async {
      // Arrange
      when(
        () => mockRepository.searchSuggestions(any()),
      ).thenAnswer((_) async => const Result.success(tSuggestions));

      // Act
      final result = await useCase('123 Main');

      // Assert
      expect(result, const Result.success(tSuggestions));
      verify(() => mockRepository.searchSuggestions('123 Main')).called(1);
    });

    test('propagates network failure', () async {
      // Arrange
      when(
        () => mockRepository.searchSuggestions(any()),
      ).thenAnswer((_) async => const Result.failure(AppFailure.network()));

      // Act
      final result = await useCase('query');

      // Assert
      expect(
        result,
        const Result<List<AddressSuggestionEntity>>.failure(
          AppFailure.network(),
        ),
      );
    });
  });
}
