# Dependency Injection Standards

## Stack

- **getIt** — Service locator
- **Injectable** — Code generation for getIt registration

## Setup

Configuration is in `lib/core/di/injection.dart`:

```dart
final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async => getIt.init();
```

External dependencies (SharedPreferences, FlutterSecureStorage, Dio) are registered in `lib/core/di/register_module.dart`.

## Annotation Guide

| Annotation | Use Case |
|-----------|----------|
| `@injectable` | Transient — new instance each time (Cubits, UseCases) |
| `@singleton` | Singleton — one instance for app lifetime (Repositories, Datasources, Services) |
| `@Singleton(as: AbstractType)` | Bind implementation to abstract contract |
| `@preResolve` | For async factory methods (SharedPreferences) |
| `@module` | For third-party dependencies that can't be annotated |

## Rules

1. **Cubits are `@injectable`** — each widget gets its own Cubit instance.
2. **Repositories and Datasources are `@Singleton`** — shared across the app.
3. **Use cases are `@injectable`** — stateless, cheap to create.
4. **Never use BlocProvider** — obtain Cubit from `getIt<MyCubit>()`.
5. **Always bind to abstract types** — `@Singleton(as: LoginRepository)` on `LoginRepositoryImpl`.

## After Adding New Classes

Run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

This regenerates `injection.config.dart`.

## Constructor Injection

All dependencies are injected through constructors. getIt resolves the dependency graph automatically.

```dart
@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());
}

@injectable
class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final LoginRepository _repository;
  const LoginUseCase(this._repository);
}

@Singleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource _remoteDatasource;
  final SecureStorageService _secureStorage;
  const LoginRepositoryImpl(this._remoteDatasource, this._secureStorage);
}
```
