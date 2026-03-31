import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/onboarding_data_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/get_address_details_usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/search_address_usecase.dart';
import 'package:onboarding_app/features/onboarding/domain/usecases/submit_onboarding_usecase.dart';
import 'package:onboarding_app/features/onboarding/presentation/cubit/onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  final SubmitOnboardingUseCase _submitUseCase;
  final SearchAddressUseCase _searchAddressUseCase;
  final GetAddressDetailsUseCase _getAddressDetailsUseCase;

  OnboardingCubit(
    this._submitUseCase,
    this._searchAddressUseCase,
    this._getAddressDetailsUseCase,
  ) : super(const OnboardingState());

  // ── Reset ──────────────────────────────────────────────────────────────────

  void reset() => emit(const OnboardingState());

  // ── Navigation ─────────────────────────────────────────────────────────────

  void nextStep() => emit(state.copyWith(currentStep: state.currentStep + 1));

  void previousStep() =>
      emit(state.copyWith(currentStep: state.currentStep - 1));

  void goToStep(int step) => emit(state.copyWith(currentStep: step));

  // ── Step 1: Full name ──────────────────────────────────────────────────────

  void updateFullName(String name) => emit(state.copyWith(fullName: name));

  // ── Step 2: Date of birth ──────────────────────────────────────────────────

  void updateDateOfBirth(DateTime dob) => emit(state.copyWith(dateOfBirth: dob));

  // ── Step 3: Address (manual edits) ────────────────────────────────────────

  void updateStreetAddress(String value) =>
      emit(state.copyWith(streetAddress: value));

  void updateCity(String value) => emit(state.copyWith(city: value));

  void updateAddressState(String value) =>
      emit(state.copyWith(addressState: value));

  void updatePostalCode(String value) => emit(state.copyWith(postalCode: value));

  void updateCountry(String value) => emit(state.copyWith(country: value));

  // ── Step 3: Address autocomplete ──────────────────────────────────────────

  Future<void> searchAddress(String query) async {
    if (query.trim().isEmpty) {
      emit(state.copyWith(addressSuggestions: const []));
      return;
    }

    emit(state.copyWith(
      isLoadingAddressSuggestions: true,
      addressSuggestionsError: null,
    ));

    final result = await _searchAddressUseCase(query);

    result.when(
      success: (suggestions) => emit(state.copyWith(
        isLoadingAddressSuggestions: false,
        addressSuggestions: suggestions,
        isAddressAutocompleteAvailable: true,
      )),
      failure: (failure) {
        final message = failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg ?? 'Address search unavailable',
          cache: (msg) => msg ?? 'Address search unavailable',
          auth: (msg) => msg ?? 'Address search unavailable',
          unknown: (msg) => msg ?? 'Address search unavailable',
        );
        emit(state.copyWith(
          isLoadingAddressSuggestions: false,
          addressSuggestions: const [],
          isAddressAutocompleteAvailable: false,
          addressSuggestionsError: message,
        ));
      },
    );
  }

  Future<void> selectAddressSuggestion(
    AddressSuggestionEntity suggestion,
  ) async {
    emit(state.copyWith(
      isLoadingAddressSuggestions: true,
      addressSuggestions: const [],
    ));

    final result = await _getAddressDetailsUseCase(suggestion.placeId);

    result.when(
      success: (address) => emit(state.copyWith(
        isLoadingAddressSuggestions: false,
        streetAddress: address.streetAddress,
        city: address.city,
        addressState: address.addressState,
        postalCode: address.postalCode,
        country: address.country,
      )),
      failure: (_) =>
          emit(state.copyWith(isLoadingAddressSuggestions: false)),
    );
  }

  // ── Step 4: Submit ─────────────────────────────────────────────────────────

  Future<void> submit() async {
    emit(state.copyWith(isSubmitting: true, isError: false, errorMessage: null));

    final entity = OnboardingDataEntity(
      fullName: state.fullName,
      dateOfBirth: state.dateOfBirth!,
      streetAddress: state.streetAddress,
      city: state.city,
      addressState: state.addressState,
      postalCode: state.postalCode,
      country: state.country,
    );

    final result = await _submitUseCase(entity);

    result.when(
      success: (_) =>
          emit(state.copyWith(isSubmitting: false, isSubmitted: true)),
      failure: (failure) {
        final message = failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg ?? 'Network error. Please try again.',
          cache: (msg) => msg ?? 'An error occurred.',
          auth: (msg) => msg ?? 'Authentication error.',
          unknown: (msg) => msg ?? 'An unexpected error occurred.',
        );
        emit(state.copyWith(
          isSubmitting: false,
          isError: true,
          errorMessage: message,
        ));
      },
    );
  }
}
