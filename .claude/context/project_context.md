# Project Context

## Overview

This is a production-grade Flutter application built with:
- **Clean Architecture** (strict layer separation)
- **TDD** (test-first development, full test coverage)
- **getIt + Injectable** (DI — no BlocProvider)
- **Cubit + Freezed** (state management)
- **go_router** (navigation)
- **Dio** (networking with auth refresh interceptor)
- **shared_preferences** (non-sensitive local storage)
- **flutter_secure_storage** (sensitive data: tokens)
- **Firebase Crashlytics + Analytics** (observability, abstracted behind services)

## Key Patterns

### BlocBuilderX / BlocConsumerX
Custom wrapper widgets that resolve Cubit from `getIt` instead of using `BlocProvider`. This decouples state management from the widget tree.

### Result<T> Union
Generic Freezed union for operation outcomes:
- `Result.success(T data)`
- `Result.failure(AppFailure failure)`

`AppFailure` is also a Freezed union: `server`, `network`, `cache`, `auth`, `unknown`.

### Error Flow
```
DioException → NetworkErrorMapper → AppException → Repository catches → mapExceptionToFailure → Result.failure
```

### Auth Refresh
`AuthInterceptor` (QueuedInterceptor) handles automatic token refresh on 401 responses using a separate Dio instance.

## Standards

All project standards are documented in `.claude/standards/`:
- `architecture.md` — folder structure, naming, data flow
- `feature_creation.md` — step-by-step feature guide
- `cubit_usage.md` — Cubit + state patterns
- `dependency_injection.md` — getIt + Injectable rules
- `testing.md` — test structure, mocking, patterns
- `theming.md` — color system, theme usage
- `networking.md` — Dio, interceptors, error mapping

## Quick Commands

```bash
# Get dependencies
flutter pub get

# Generate code (Freezed, Injectable, JSON)
dart run build_runner build --delete-conflicting-outputs

# Watch mode for code generation
dart run build_runner watch --delete-conflicting-outputs

# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze
```
