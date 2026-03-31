# Theming Standards

## Structure

Theme files live in `lib/core/theme/`:

```
core/theme/
├── app_colors.dart       # Color palette + semantic color roles
├── app_text_theme.dart   # Light/dark text themes
└── app_theme.dart        # ThemeData construction
```

## Color System

`AppColors` defines:

1. **Brand palette** — raw hex colors from the design system
2. **Light semantic colors** — `lightPrimary`, `lightSurface`, etc.
3. **Dark semantic colors** — `darkPrimary`, `darkSurface`, etc.

### Brand Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Teal | `#027975` | Light primary |
| Teal Dark | `#056964` | Primary variant |
| Teal Deep | `#054D47` | Dark primary container |
| Green | `#00BA7E` | Dark primary, success |
| Green Dark | `#008000` | Success variant |
| Black | `#000000` | Pure black |
| Charcoal | `#212121` | Light text primary |
| Dark Grey | `#333333` | Light text secondary |
| Off White | `#F7FAFF` | Light background, dark text |
| Blue | `#0056A7` | Secondary / accent |

## Usage

Always access colors through `Theme.of(context)` or the context extension:

```dart
// Via extension
context.colorScheme.primary
context.textTheme.headlineMedium

// Direct
Theme.of(context).colorScheme.primary
```

**Never** hardcode colors in widgets. Always reference the theme.

## Adding New Colors

1. Add the raw color to `AppColors` brand palette section.
2. Map it to a semantic role in both light and dark sections.
3. Reference via `ColorScheme` or `ThemeData` extensions.

## Theme Mode

The app respects system theme mode by default:

```dart
MaterialApp.router(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
)
```
