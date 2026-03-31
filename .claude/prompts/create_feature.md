# Create Feature Prompt

Use this prompt to instruct Claude to generate a new feature following the exact conventions of this repository.

---

## Prompt

You are generating a new feature for a Flutter project that follows Clean Architecture with strict conventions.

**Read the following standard files before generating any code:**
- `.claude/standards/architecture.md`
- `.claude/standards/feature_creation.md`
- `.claude/standards/cubit_usage.md`
- `.claude/standards/dependency_injection.md`
- `.claude/standards/testing.md`

**Reference the existing `login` feature as the canonical example:**
- `lib/features/login/` (full implementation)
- `test/features/login/` (full test suite)

---

### Feature: `{FEATURE_NAME}`

**Description:** {BRIEF_DESCRIPTION}

**API endpoints (if any):**
- `{METHOD} {PATH}` — {description}

**Entity fields:**
- {field}: {type}

---

### Generate the following files:

#### Domain Layer
1. `lib/features/{feature_name}/domain/entities/{feature_name}_entity.dart`
   - Plain Dart class, no Freezed
   - `const` constructor

2. `lib/features/{feature_name}/domain/repositories/{feature_name}_repository.dart`
   - Abstract class
   - Methods return `Future<Result<T>>`

3. `lib/features/{feature_name}/domain/usecases/{action}_params.dart`
   - `@freezed` class
   - Use `NoParams` from `core/usecase/usecase.dart` if no params needed

4. `lib/features/{feature_name}/domain/usecases/{action}_usecase.dart`
   - `@injectable`
   - Implements `UseCase<T, P>` from `core/usecase/usecase.dart`

#### Data Layer
5. `lib/features/{feature_name}/data/models/{feature_name}_request.dart`
   - `@freezed` + `fromJson`/`toJson`

6. `lib/features/{feature_name}/data/models/{feature_name}_response.dart`
   - `@freezed` + `fromJson`
   - Use `@JsonKey(name: 'snake_case')` for API field mapping

7. `lib/features/{feature_name}/data/mappers/{feature_name}_mapper.dart`
   - Static methods: `toEntity(Model) → Entity`
   - Private constructor

8. `lib/features/{feature_name}/data/datasources/{feature_name}_remote_datasource.dart`
   - Abstract class

9. `lib/features/{feature_name}/data/datasources/{feature_name}_remote_datasource_impl.dart`
   - `@Singleton(as: XxxRemoteDatasource)`
   - Catch `DioException` → throw `AppException` via `NetworkErrorMapper`

10. `lib/features/{feature_name}/data/repositories/{feature_name}_repository_impl.dart`
    - `@Singleton(as: XxxRepository)`
    - Catch `AppException` → return `Result.failure(mapExceptionToFailure(e))`
    - Catch generic `Exception` → return `Result.failure(AppFailure.unknown(...))`

#### Presentation Layer
11. `lib/features/{feature_name}/presentation/cubit/{feature_name}_state.dart`
    - `@freezed sealed class`
    - States: `initial`, `loading`, `success(T)`, `failure(String)`

12. `lib/features/{feature_name}/presentation/cubit/{feature_name}_cubit.dart`
    - `@injectable`
    - Use `result.when(...)` for exhaustive handling
    - Map `AppFailure` to user-friendly message strings

13. `lib/features/{feature_name}/presentation/pages/{feature_name}_page.dart`
    - Use `BlocConsumerX` (if side effects needed) or `BlocBuilderX`
    - **No BlocProvider**

14. `lib/features/{feature_name}/presentation/widgets/{feature_name}_*.dart`
    - Extract reusable widget components
    - Pass data and callbacks via constructor

#### Router (if navigable)
15. Add route to `lib/core/router/app_routes.dart`
16. Add GoRoute to `lib/core/router/app_router.dart`

#### Tests
17. `test/features/{feature_name}/domain/usecases/{action}_usecase_test.dart`
18. `test/features/{feature_name}/data/repositories/{feature_name}_repository_impl_test.dart`
19. `test/features/{feature_name}/data/datasources/{feature_name}_remote_datasource_test.dart`
20. `test/features/{feature_name}/data/mappers/{feature_name}_mapper_test.dart`
21. `test/features/{feature_name}/presentation/cubit/{feature_name}_cubit_test.dart`
22. `test/features/{feature_name}/presentation/widgets/{feature_name}_*_test.dart`

---

### Critical Rules

- **NO BlocProvider.** Cubits come from `getIt`.
- **Use BlocBuilderX / BlocConsumerX** from `core/widgets/`.
- **All states use @freezed sealed classes.**
- **All params use @freezed classes.**
- **All models use @freezed + json_serializable.**
- **Entities are plain Dart classes** (no code generation).
- **Repository implementations return `Result<T>`** — never throw.
- **Datasource implementations throw `AppException`** — never return Result.
- **Use `mapExceptionToFailure()`** in repositories.
- **Use `NetworkErrorMapper.mapDioException()`** in datasources.
- **Tests use mocktail + bloc_test.**
- **Follow Arrange-Act-Assert pattern.**
- **Register fallback values in `setUpAll`.**

After generating all files, remind the developer to run:
```bash
dart run build_runner build --delete-conflicting-outputs
```
