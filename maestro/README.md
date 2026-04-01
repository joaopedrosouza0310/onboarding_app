# Maestro UI Tests — Onboarding App

## Prerequisites

1. Install Maestro:
   ```bash
   curl -Ls "https://get.maestro.mobile.dev" | bash
   export PATH="$PATH:$HOME/.maestro/bin"
   ```

2. Build and install the app on a running iOS simulator:
   ```bash
   flutter build ios --simulator
   xcrun simctl install booted build/ios/iphonesimulator/Runner.app
   ```

   Or use the VSCode task: **maestro: run all flows**

## Running Tests

### Run all flows
```bash
maestro test --device <SIMULATOR_UDID> maestro/flows
```

Get the UDID of the booted simulator:
```bash
xcrun simctl list devices | grep Booted
```

### Run a single flow
```bash
maestro test --device <SIMULATOR_UDID> maestro/flows/onboarding_happy_path.yaml
```

### View debug output (screenshots + hierarchy)
```
~/.maestro/tests/<timestamp>/
```

## Available Flows

| Flow | What it tests |
|---|---|
| `navigation.yaml` | App launches, reaches step 1, key elements visible |
| `onboarding_happy_path.yaml` | Full flow end-to-end with valid data → success page |
| `onboarding_name_edge_case.yaml` | Mononym (single name) is accepted |
| `onboarding_name_validation.yaml` | Empty name and invalid characters show correct errors |
| `onboarding_dob_edge_case.yaml` | Tapping Continue without selecting DOB shows validation error |
| `onboarding_address_flow.yaml` | Address filled manually → review shows correct data |
| `onboarding_navigation.yaml` | Data is preserved when navigating back and forward between steps |
| `onboarding_address_validation.yaml` | Required address fields show validation errors when empty |
| `onboarding_address_autocomplete.yaml` | Address filled via Google Places autocomplete suggestion → fields auto-populated → review |
| `onboarding_review_edit.yaml` | Edit button in review navigates back to step; updated data reflects on return |
| `onboarding_success_reset.yaml` | Complete flow → success page → "Get Started" resets to step 1 |

## Semantic Identifiers

Widgets expose identifiers via `Semantics(identifier: '...')` for reliable targeting:

| Identifier | Widget |
|---|---|
| `fullNameField` | Full name text field |
| `dobPickerButton` | Date of birth picker button |
| `addressSearchField` | Address autocomplete search field |
| `streetAddressField` | Street address field |
| `cityField` | City field |
| `stateField` | State / Province field |
| `postalCodeField` | Postal code field |
| `countryField` | Country field |
| `backButton` | Back button (all steps) |
| `nextButton` | Continue button (name and DOB steps) |
| `submitButton` | Confirm & Finish button (review step) |
| `reviewSection_name_editButton` | Name section edit button in review |
| `reviewSection_dob_editButton` | DOB section edit button in review |
| `reviewSection_address_editButton` | Address section edit button in review |

## iOS-specific Notes

- **DOB picker**: `tapOn: id: "dobPickerButton"` lands in the wrong area due to iOS accessibility bounds merging. Use `tapOn: point: "50%, 32%"` to hit the InkWell directly.
- **Keyboard**: The keyboard stays open when transitioning from the address step. Always call `hideKeyboard` after tapping Continue on the address step, before asserting review content.
- **Semantic IDs vs text**: On iOS 26, nested `Semantics` nodes inside containers can be merged into a parent node. Prefer `tapOn: text: "..."` or `tapOn: point: "..."` over `tapOn: id: "..."` for buttons. Use `assertVisible: id: "..."` only for section-level identifiers that are confirmed accessible.
- **Multi-line text**: `assertVisible: text:` uses regex matching. Text rendered with `\n` is stored as a single accessibility string — assert a substring that doesn't cross the line break.

## CI/CD Integration

```yaml
- name: Build iOS app
  run: flutter build ios --simulator

- name: Install app
  run: xcrun simctl install booted build/ios/iphonesimulator/Runner.app

- name: Run Maestro tests
  run: maestro test --device $SIMULATOR_UDID maestro/flows --format junit
```
