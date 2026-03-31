# Feature Creation Standards

## Step-by-step feature creation

When creating a new feature, follow this exact order:

### 1. Create the domain layer first

```
features/<name>/domain/
├── entities/<name>_entity.dart
├── repositories/<name>_repository.dart       # Abstract contract
└── usecases/
    ├── <action>_params.dart                   # Freezed params
    └── <action>_usecase.dart                  # Implements UseCase<T, P>
```

- Entities are plain Dart classes. No Freezed — keep them lightweight.
- Repository contracts are abstract classes returning `Future<Result<T>>`.
- Use case params use `@freezed`. If no params needed, use `NoParams`.
- Use cases extend `UseCase<T, P>` from `core/usecase/usecase.dart`.

### 2. Create the data layer

```
features/<name>/data/
├── datasources/
│   ├── <name>_remote_datasource.dart          # Abstract
│   └── <name>_remote_datasource_impl.dart     # Implementation
├── models/
│   ├── <name>_request.dart                    # Freezed + json_serializable
│   └── <name>_response.dart                   # Freezed + json_serializable
├── mappers/<name>_mapper.dart                  # Static Model → Entity
└── repositories/<name>_repository_impl.dart    # Implements domain contract
```

- Datasource implementations catch `DioException` and rethrow as `AppException`.
- Repository implementations catch `AppException` and return `Result.failure(...)`.
- Use `mapExceptionToFailure()` from `core/error/error_mapper.dart`.
- Models use `@freezed` + `@JsonSerializable` for JSON serialization.

### 3. Create the presentation layer

```
features/<name>/presentation/
├── cubit/
│   ├── <name>_cubit.dart
│   └── <name>_state.dart
├── pages/<name>_page.dart
└── widgets/<name>_<component>.dart
```

- States use `@freezed` sealed classes.
- Cubits are `@injectable`.
- Pages use `BlocBuilderX` or `BlocConsumerX` — **never BlocProvider**.

### 4. Register with DI

All implementations get `@Singleton` or `@injectable` annotations:

- Datasource impl: `@Singleton(as: XxxDatasource)`
- Repository impl: `@Singleton(as: XxxRepository)`
- Use case: `@injectable`
- Cubit: `@injectable`

Run `dart run build_runner build` after adding new injectable classes.

### 5. Add route (if needed)

Add a new route entry in:
- `lib/core/router/app_routes.dart` (path + name constants)
- `lib/core/router/app_router.dart` (GoRoute entry)

### 6. Write tests

Mirror the `lib/` structure under `test/`:

```
test/features/<name>/
├── data/
│   ├── datasources/<name>_remote_datasource_test.dart
│   ├── mappers/<name>_mapper_test.dart
│   └── repositories/<name>_repository_impl_test.dart
├── domain/
│   └── usecases/<action>_usecase_test.dart
└── presentation/
    ├── cubit/<name>_cubit_test.dart
    └── widgets/<name>_<component>_test.dart
```
