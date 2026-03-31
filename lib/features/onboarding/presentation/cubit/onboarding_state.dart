import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    // ── Navigation ──────────────────────────────────────────
    @Default(0) int currentStep,

    // ── Step 1: Full legal name ──────────────────────────────
    @Default('') String fullName,

    // ── Step 2: Date of birth ────────────────────────────────
    DateTime? dateOfBirth,

    // ── Step 3: Residential address ──────────────────────────
    @Default('') String streetAddress,
    @Default('') String city,
    @Default('') String addressState,
    @Default('') String postalCode,
    @Default('') String country,

    // Address autocomplete
    @Default(<AddressSuggestionEntity>[])
    List<AddressSuggestionEntity> addressSuggestions,
    @Default(false) bool isLoadingAddressSuggestions,
    String? addressSuggestionsError,
    @Default(true) bool isAddressAutocompleteAvailable,

    // ── Async / error flags ──────────────────────────────────
    @Default(false) bool isSubmitting,
    @Default(false) bool isSubmitted,
    @Default(false) bool isError,
    String? errorMessage,
  }) = _OnboardingState;
}
