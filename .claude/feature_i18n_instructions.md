# i18n - Claude workflow

This project now supports internationalization for the following languages:

- en (default)
- es
- ru
- de

Localization source files are in `lib/l10n/`:

- `intl_en.arb`
- `intl_es.arb`
- `intl_ru.arb`
- `intl_de.arb`

### Auto-translation / missing key validation

Added:

- `tool/i18n_translate.dart`

Commands:

- `dart run tool/i18n_translate.dart` -> list missing keys
- `dart run tool/i18n_translate.dart --fill` -> fill missing keys with `__TRANSLATE_ME__`
- `dart run tool/i18n_translate.dart --claude` -> fill missing keys with CLAUDE markup (skeleton; requires manual `CLAUDE_API_KEY` API implementation)

### Applying localization in app

1. Ensure app uses `MaterialApp.router(... localizationsDelegates...)` (already configured in `lib/app/app.dart`).
2. Use `AppLocalizations.of(context)!.<message>` in widgets (examples in `name_step`, `date_of_birth_step`, `success_page`, `onboarding_page`).
3. Run:
   - `fvm flutter pub get`
   - `fvm flutter gen-l10n`
   - `fvm flutter pub run build_runner build --delete-conflicting-outputs`
