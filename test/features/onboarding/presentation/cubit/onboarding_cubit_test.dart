import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/get_address_details_usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/search_address_usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/submit_onboarding_usecase.dart';
import 'package:onboarding_app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:onboarding_app/features/onboarding/presentation/cubit/onboarding_state.dart';

class MockSubmitOnboardingUseCase extends Mock
    implements SubmitOnboardingUseCase {}

class MockSearchAddressUseCase extends Mock implements SearchAddressUseCase {}

class MockGetAddressDetailsUseCase extends Mock
    implements GetAddressDetailsUseCase {}

void main() {
  late OnboardingCubit cubit;
  late MockSubmitOnboardingUseCase mockSubmitUseCase;
  late MockSearchAddressUseCase mockSearchUseCase;
  late MockGetAddressDetailsUseCase mockGetDetailsUseCase;

  setUp(() {
    mockSubmitUseCase = MockSubmitOnboardingUseCase();
    mockSearchUseCase = MockSearchAddressUseCase();
    mockGetDetailsUseCase = MockGetAddressDetailsUseCase();
    cubit = OnboardingCubit(
      mockSubmitUseCase,
      mockSearchUseCase,
      mockGetDetailsUseCase,
    );
  });

  tearDown(() => cubit.close());

  setUpAll(() {
    registerFallbackValue(
      OnboardingDataEntity(
        fullName: '',
        dateOfBirth: DateTime(2000),
        streetAddress: '',
        city: '',
        addressState: '',
        postalCode: '',
        country: '',
      ),
    );
  });

  group('OnboardingCubit — initial state', () {
    test('starts at step 0 with empty fields', () {
      expect(cubit.state.currentStep, 0);
      expect(cubit.state.fullName, '');
      expect(cubit.state.isSubmitting, false);
      expect(cubit.state.isSubmitted, false);
      expect(cubit.state.isError, false);
    });
  });

  group('OnboardingCubit — navigation', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'nextStep increments currentStep',
      build: () => cubit,
      act: (c) => c.nextStep(),
      verify: (c) => expect(c.state.currentStep, 1),
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'previousStep decrements currentStep',
      build: () => cubit,
      seed: () => const OnboardingState(currentStep: 2),
      act: (c) => c.previousStep(),
      verify: (c) => expect(c.state.currentStep, 1),
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'goToStep jumps to the given step',
      build: () => cubit,
      act: (c) => c.goToStep(3),
      verify: (c) => expect(c.state.currentStep, 3),
    );
  });

  group('OnboardingCubit — field updates', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'updateFullName persists the name',
      build: () => cubit,
      act: (c) => c.updateFullName('María García'),
      verify: (c) => expect(c.state.fullName, 'María García'),
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'updateDateOfBirth persists the date',
      build: () => cubit,
      act: (c) => c.updateDateOfBirth(DateTime(1990, 5, 15)),
      verify: (c) => expect(c.state.dateOfBirth, DateTime(1990, 5, 15)),
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'address field helpers persist each field independently',
      build: () => cubit,
      act: (c) {
        c.updateStreetAddress('123 Main St');
        c.updateCity('San Francisco');
        c.updateAddressState('California');
        c.updatePostalCode('94105');
        c.updateCountry('United States');
      },
      verify: (c) {
        expect(c.state.streetAddress, '123 Main St');
        expect(c.state.city, 'San Francisco');
        expect(c.state.addressState, 'California');
        expect(c.state.postalCode, '94105');
        expect(c.state.country, 'United States');
      },
    );
  });

  group('OnboardingCubit — address autocomplete', () {
    const tSuggestions = [
      AddressSuggestionEntity(
        placeId: 'abc',
        description: '123 Main St, SF',
      ),
    ];

    blocTest<OnboardingCubit, OnboardingState>(
      'searchAddress emits loading then suggestions on success',
      build: () {
        when(() => mockSearchUseCase(any()))
            .thenAnswer((_) async => const Result.success(tSuggestions));
        return cubit;
      },
      act: (c) => c.searchAddress('123 Main'),
      expect: () => [
        const OnboardingState(isLoadingAddressSuggestions: true),
        const OnboardingState(
          isLoadingAddressSuggestions: false,
          addressSuggestions: tSuggestions,
          isAddressAutocompleteAvailable: true,
        ),
      ],
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'searchAddress marks autocomplete unavailable on network failure',
      build: () {
        when(() => mockSearchUseCase(any())).thenAnswer(
          (_) async => const Result.failure(
            AppFailure.network(message: 'Address search unavailable'),
          ),
        );
        return cubit;
      },
      act: (c) => c.searchAddress('query'),
      verify: (c) {
        expect(c.state.isAddressAutocompleteAvailable, false);
        expect(c.state.addressSuggestionsError, isNotNull);
      },
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'searchAddress with empty query clears suggestions without network call',
      build: () => cubit,
      act: (c) => c.searchAddress('   '),
      verify: (c) {
        expect(c.state.addressSuggestions, isEmpty);
        verifyNever(() => mockSearchUseCase(any()));
      },
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'selectAddressSuggestion populates address fields on success',
      build: () {
        when(() => mockGetDetailsUseCase(any())).thenAnswer(
          (_) async => const Result.success(
            AddressEntity(
              streetAddress: '123 Main Street',
              city: 'San Francisco',
              addressState: 'California',
              postalCode: '94105',
              country: 'United States',
            ),
          ),
        );
        return cubit;
      },
      act: (c) => c.selectAddressSuggestion(
        const AddressSuggestionEntity(placeId: 'abc', description: '123 Main'),
      ),
      verify: (c) {
        expect(c.state.streetAddress, '123 Main Street');
        expect(c.state.city, 'San Francisco');
        expect(c.state.addressState, 'California');
        expect(c.state.postalCode, '94105');
        expect(c.state.country, 'United States');
      },
    );
  });

  group('OnboardingCubit — submit', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'submit emits isSubmitting then isSubmitted on success',
      build: () {
        when(() => mockSubmitUseCase(any()))
            .thenAnswer((_) async => const Result.success(true));
        return cubit;
      },
      seed: () => OnboardingState(
        fullName: 'Test User',
        dateOfBirth: DateTime(1990, 1, 1),
        streetAddress: '123 St',
        city: 'City',
        addressState: 'State',
        postalCode: '00000',
        country: 'Country',
      ),
      act: (c) => c.submit(),
      expect: () => [
        OnboardingState(
          fullName: 'Test User',
          dateOfBirth: DateTime(1990, 1, 1),
          streetAddress: '123 St',
          city: 'City',
          addressState: 'State',
          postalCode: '00000',
          country: 'Country',
          isSubmitting: true,
        ),
        OnboardingState(
          fullName: 'Test User',
          dateOfBirth: DateTime(1990, 1, 1),
          streetAddress: '123 St',
          city: 'City',
          addressState: 'State',
          postalCode: '00000',
          country: 'Country',
          isSubmitting: false,
          isSubmitted: true,
        ),
      ],
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'submit emits isError with message on failure',
      build: () {
        when(() => mockSubmitUseCase(any())).thenAnswer(
          (_) async => const Result.failure(
            AppFailure.server(message: 'Server error', statusCode: 500),
          ),
        );
        return cubit;
      },
      seed: () => OnboardingState(
        fullName: 'Test',
        dateOfBirth: DateTime(2000),
        streetAddress: 'St',
        city: 'C',
        postalCode: '1',
        country: 'X',
      ),
      act: (c) => c.submit(),
      verify: (c) {
        expect(c.state.isError, true);
        expect(c.state.errorMessage, 'Server error');
        expect(c.state.isSubmitting, false);
      },
    );
  });

  group('OnboardingCubit — state preservation across steps', () {
    test('going back and forward keeps all data intact', () {
      // Arrange
      cubit.updateFullName('João Pedro');
      cubit.updateDateOfBirth(DateTime(1995, 3, 15));
      cubit.nextStep();
      cubit.nextStep();
      cubit.updateStreetAddress('Rua das Flores 42');
      cubit.updateCity('Porto');

      // Act — navigate back to step 1 and forward again
      cubit.goToStep(0);
      cubit.nextStep();

      // Assert — data is fully preserved
      expect(cubit.state.fullName, 'João Pedro');
      expect(cubit.state.dateOfBirth, DateTime(1995, 3, 15));
      expect(cubit.state.streetAddress, 'Rua das Flores 42');
      expect(cubit.state.city, 'Porto');
    });
  });
}
