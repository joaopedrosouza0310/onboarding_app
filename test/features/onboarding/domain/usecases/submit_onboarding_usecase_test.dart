import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/submit_onboarding_usecase.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  late SubmitOnboardingUseCase useCase;
  late MockOnboardingRepository mockRepository;

  final tEntity = OnboardingDataEntity(
    fullName: 'María García',
    dateOfBirth: DateTime(1990, 5, 15),
    streetAddress: '123 Main St',
    city: 'San Francisco',
    addressState: 'California',
    postalCode: '94105',
    country: 'United States',
  );

  setUp(() {
    mockRepository = MockOnboardingRepository();
    useCase = SubmitOnboardingUseCase(mockRepository);
  });

  setUpAll(() {
    registerFallbackValue(tEntity);
  });

  group('SubmitOnboardingUseCase', () {
    test('delegates to repository and returns success', () async {
      // Arrange
      when(() => mockRepository.submit(any()))
          .thenAnswer((_) async => const Result.success(true));

      // Act
      final result = await useCase(tEntity);

      // Assert
      expect(result, const Result.success(true));
      verify(() => mockRepository.submit(tEntity)).called(1);
    });

    test('propagates repository failure', () async {
      // Arrange
      when(() => mockRepository.submit(any())).thenAnswer(
        (_) async => const Result.failure(
          AppFailure.network(message: 'No connection'),
        ),
      );

      // Act
      final result = await useCase(tEntity);

      // Assert
      result.when(
        success: (_) => fail('Should not succeed'),
        failure: (f) => f.whenOrNull(
          network: (msg) => expect(msg, 'No connection'),
        ),
      );
    });
  });
}
