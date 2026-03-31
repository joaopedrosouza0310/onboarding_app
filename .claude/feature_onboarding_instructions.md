# Onboarding Feature — Implementation Reference

This document captures every decision made while building the onboarding feature.
Use it as the canonical reference when generating future features or extending this one.

---

## Feature overview

A 4-step in-app onboarding flow that collects:
1. Full legal name
2. Date of birth
3. Residential address (with Google Places Autocomplete + manual fallback)
4. Review / confirmation screen

All state lives in memory. No backend call for submission (stub returns success).
Places API is called via Dio using a key loaded from `.env`.

---

## Folder structure produced

```
lib/features/onboarding/
├── data/
│   ├── datasources/
│   │   ├── places_remote_datasource.dart          # Abstract contract
│   │   └── places_remote_datasource_impl.dart     # @Singleton(as: PlacesRemoteDatasource)
│   ├── mappers/
│   │   └── places_mapper.dart                     # Static Model → Entity mappers
│   ├── models/
│   │   ├── place_details_model.dart               # @freezed + json_serializable
│   │   └── place_suggestion_model.dart            # @freezed + json_serializable
│   └── repositories/
│       ├── onboarding_repository_impl.dart        # @Singleton(as: OnboardingRepository)
│       └── places_repository_impl.dart            # @Singleton(as: PlacesRepository)
├── domain/
│   ├── entities/
│   │   ├── address_entity.dart
│   │   ├── address_suggestion_entity.dart
│   │   └── onboarding_data_entity.dart
│   ├── repositories/
│   │   ├── onboarding_repository.dart             # Abstract
│   │   └── places_repository.dart                 # Abstract
│   └── usecases/
│       ├── get_address_details_usecase.dart        # @injectable
│       ├── search_address_usecase.dart             # @injectable
│       └── submit_onboarding_usecase.dart          # @injectable
└── presentation/
    ├── cubit/
    │   ├── onboarding_cubit.dart                  # @injectable
    │   └── onboarding_state.dart                  # @freezed data class
    ├── pages/
    │   └── onboarding_page.dart                   # StatefulWidget
    └── widgets/
        ├── address_step.dart
        ├── date_of_birth_step.dart
        ├── name_step.dart
        ├── onboarding_progress_indicator.dart
        ├── onboarding_text_field.dart              # Reusable form field
        └── review_step.dart
```

---

## Cubit state pattern (project standard as of this feature)

**Do NOT use sealed unions for Cubit state.** Use a single `@freezed` data class:

```dart
@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
    // ... domain payload fields
  }) = _OnboardingState;
}
```

**Update state via `emitState` + `copyWith`:**

```dart
void emitState(OnboardingState Function(OnboardingState) updater) =>
    emit(updater(state));

// Usage:
emitState((s) => s.copyWith(isLoading: true));
emitState((s) => s.copyWith(isLoading: false, isError: true, errorMessage: 'Oops'));
```

**Never do:**
```dart
// ❌ Old sealed-union pattern — do not use
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  ...
}
```

---

## Cubit wiring — getIt, NO BlocProvider

Cubits are `@injectable` (factory). Every page resolves its own instance.

**StatelessWidget** — use `BlocBuilderX` / `BlocConsumerX`:
```dart
BlocConsumerX<MyCubit, MyState>(
  listenWhen: (prev, curr) => prev.isSubmitted != curr.isSubmitted,
  listener: (context, state, cubit) {
    if (state.isSubmitted) context.go(AppRoutes.home);
  },
  builder: (context, state, cubit) => MyWidget(state: state),
)
```

**StatefulWidget** (needed for `PageController`, animations, etc.) — resolve from
`getIt` in `initState` and use standard `BlocConsumer(bloc: _cubit, ...)`:
```dart
late final MyCubit _cubit;

@override
void initState() {
  super.initState();
  _cubit = getIt<MyCubit>();
}

@override
Widget build(BuildContext context) {
  return BlocConsumer<MyCubit, MyState>(
    bloc: _cubit,
    listener: ...,
    builder: ...,
  );
}
```

Calling `getIt<Cubit>()` twice (e.g., once in `initState` and once via
`BlocConsumerX`) creates **two different factory instances**. Always use one or
the other, never both on the same page.

---

## Environment / API keys

Keys are stored in `.env` at project root and loaded via `flutter_dotenv`:

```
# .env  ← never commit real values, listed in .gitignore
GOOGLE_PLACES_API_KEY=
```

Load order in `main.dart`:
```dart
await dotenv.load(fileName: '.env');
await configureDependencies();
runApp(const App());
```

Access via constants:
```dart
class PlacesApiConstants {
  static String get apiKey => dotenv.env['GOOGLE_PLACES_API_KEY'] ?? '';
}
```

Never use `--dart-define` or hard-code keys in source files.

---

## Validation rules

### Full name
- Required (min 1 char — supports mononyms)
- Max 150 characters
- Unicode-aware regex: `^[\p{L}\p{M} .'\-]+$` (letters, spaces, hyphens, apostrophes, periods)
- Validate **on blur** and **on form submit**, NOT on every keystroke

### Date of birth
- Required — no future dates
- Minimum age: `OnboardingConstants.minimumAge` (18)
- Maximum age: `OnboardingConstants.maximumAge` (120)
- Default picker position: `OnboardingConstants.defaultPickerYearsAgo` (25) years ago
- Validate on Next tap

### Address
- Street address, city, postal code, country: required
- State/Province: optional
- Validate on form submit (Next tap)

---

## Address autocomplete fallback pattern

```
API key empty or API fails
  ↓
PlacesRemoteDatasource throws NetworkException
  ↓
PlacesRepositoryImpl returns Result.failure(AppFailure.network(...))
  ↓
OnboardingCubit: isAddressAutocompleteAvailable = false, addressSuggestionsError = message
  ↓
AddressStep: hides search field, shows banner, shows all fields as editable
```

---

## Reusable widget: `OnboardingTextField`

Location: `presentation/widgets/onboarding_text_field.dart`

Key behaviors:
- Validates **on blur** (focus lost), not on every keystroke — uses `FocusNode` listener
- Clears error while user is actively editing
- Exposes `semanticsIdentifier` for Maestro / accessibility
- Delegates to `TextFormField` so it works inside a `Form` with `formKey.validate()`

---

## Routes

```dart
// app_routes.dart
static const String onboarding = '/onboarding';

// app_router.dart
GoRoute(
  path: AppRoutes.onboarding,
  name: AppRouteNames.onboarding,
  builder: (context, state) => const OnboardingPage(),
),
```

Navigate to onboarding: `context.go(AppRoutes.onboarding)`
Navigate after completion: `context.go(AppRoutes.home)`

---

## Maestro test conventions

Test flows live in `maestro/flows/onboarding_*.yaml`.

Semantic identifiers used (set via `Semantics(identifier: '...', ...)` in widgets):

| Widget | Identifier |
|---|---|
| Full name field | `fullNameField` |
| DOB picker | `dobPickerButton` |
| Address search | `addressSearchField` |
| Street address | `streetAddressField` |
| City | `cityField` |
| State/Province | `stateField` |
| Postal code | `postalCodeField` |
| Country | `countryField` |
| Next / Continue button | `nextButton` |
| Back button | `backButton` |
| Submit button | `submitButton` |
| Review: name | `reviewFullName` |
| Review: DOB | `reviewDateOfBirth` |
| Review: street | `reviewStreetAddress` |
| Review: city | `reviewCity` |
| Review: state | `reviewState` |
| Review: postal | `reviewPostalCode` |
| Review: country | `reviewCountry` |
| Section edit buttons | `reviewSection_{name}_editButton` |

---

## Test structure

Mirror `lib/` under `test/`:

```
test/features/onboarding/
├── data/
│   └── mappers/places_mapper_test.dart
├── domain/
│   └── usecases/
│       ├── search_address_usecase_test.dart
│       └── submit_onboarding_usecase_test.dart
└── presentation/
    ├── cubit/onboarding_cubit_test.dart
    └── widgets/
        ├── date_of_birth_step_test.dart
        └── name_step_test.dart
```

Test patterns:
- Arrange-Act-Assert comments in every test
- Mock with `mocktail`: `class MockX extends Mock implements X {}`
- `blocTest` for cubit tests; `testWidgets` + `tester.pumpAndSettle()` for widgets
- Pump widget in `MaterialApp(home: Scaffold(body: ...))` — no need for DI in widget tests
- Call `registerFallbackValue(...)` in `setUpAll` for any custom types used with `any()`

---

## Assumptions & trade-offs

| Decision | Reasoning |
|---|---|
| Single `OnboardingCubit` for all 4 steps | Keeps state in one place; easy to pass between steps without navigation |
| `StatefulWidget` page (not Stateless + BlocConsumerX) | Needed to hold cubit factory instance without double-resolving from getIt |
| `IndexedStack`-style step switching via `switch` | Simpler than PageView; no PageController; state preserved because cubit holds everything |
| Manual date formatter (no `intl` package) | Avoids a new dependency; English-only is acceptable for this demo |
| `flutter_dotenv` for API keys | More ergonomic than `--dart-define`; `.env` file is a familiar convention |
| In-memory submit (no backend) | Product requirement; `OnboardingRepositoryImpl` has a stub with simulated delay |
| Minimum age 18 | Product decision — configurable via `OnboardingConstants.minimumAge` |

---

## Code generation reminder

After adding any new `@freezed` or `@injectable` class, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Or in watch mode during development:
```bash
dart run build_runner watch --delete-conflicting-outputs
```

---

## Follow-up improvements

- Add backend integration in `OnboardingRepositoryImpl`
- Add a `PlacesFallbackDatasource` as an explicit offline-first strategy
- Add deep-link support so Maestro tests can navigate directly to `/onboarding`
- Persist partial onboarding progress to `SharedPreferences` so the user can resume
- Add analytics events for each step completion
- Localise step labels and validation messages with `flutter_localizations` + `intl`
- Support suffix/prefix name fields for users who specifically want them
