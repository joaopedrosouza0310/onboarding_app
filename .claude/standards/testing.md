# Testing Standards

## Philosophy

This project follows TDD principles. Every feature must have tests covering:

1. **Use case tests** — verify business logic delegation
2. **Repository tests** — verify data flow, mapping, and error handling
3. **Datasource tests** — verify API call correctness and exception handling
4. **Cubit tests** — verify state transitions
5. **Widget tests** — verify UI rendering and user interactions
6. **Mapper tests** — verify model-to-entity transformations

## Test Location

Tests mirror the `lib/` folder structure under `test/`:

```
test/
├── features/
│   └── login/
│       ├── data/
│       │   ├── datasources/login_remote_datasource_test.dart
│       │   ├── mappers/login_mapper_test.dart
│       │   └── repositories/login_repository_impl_test.dart
│       ├── domain/
│       │   └── usecases/login_usecase_test.dart
│       └── presentation/
│           ├── cubit/login_cubit_test.dart
│           └── widgets/login_form_test.dart
└── core/
    └── ... (test core utilities as needed)
```

## Mocking

Use **mocktail** for all mocks:

```dart
class MockLoginRepository extends Mock implements LoginRepository {}
```

Register fallback values in `setUpAll`:

```dart
setUpAll(() {
  registerFallbackValue(const LoginParams(email: '', password: ''));
});
```

## Cubit Tests

Use **bloc_test** for cubit testing:

```dart
blocTest<LoginCubit, LoginState>(
  'emits [loading, success] when login succeeds',
  build: () {
    when(() => mockUseCase(any()))
        .thenAnswer((_) async => const Result.success(tUser));
    return LoginCubit(mockUseCase);
  },
  act: (cubit) => cubit.login(email: 'test@example.com', password: '123456'),
  expect: () => [
    const LoginState.loading(),
    const LoginState.success(tUser),
  ],
);
```

## Repository Tests

Verify:
- Success path: datasource returns data → repository returns `Result.success`
- Failure path: datasource throws `AppException` → repository returns `Result.failure`
- Token storage on auth calls

## Datasource Tests

Verify:
- Correct API endpoint and payload
- Response parsing
- Exception mapping from DioException to AppException

## Widget Tests

Verify:
- Correct rendering of UI elements
- Form validation
- Loading state display
- Callback invocations

## Test Structure

Every test follows **Arrange-Act-Assert**:

```dart
test('description', () async {
  // Arrange
  when(() => mock.method()).thenAnswer((_) async => expected);

  // Act
  final result = await sut.method();

  // Assert
  expect(result, expected);
  verify(() => mock.method()).called(1);
});
```

## Running Tests

```bash
# All tests
flutter test

# Specific test file
flutter test test/features/login/domain/usecases/login_usecase_test.dart

# With coverage
flutter test --coverage
```
