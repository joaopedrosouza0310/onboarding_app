# Project Architecture Standards

## Overview

This project follows **Clean Architecture** with strict layer separation, **TDD**, and a feature-based folder structure.

## Architecture Layers

Every feature is organized into three layers:

```
features/<feature_name>/
├── data/
│   ├── datasources/          # Abstract + implementation
│   ├── models/                # Request/response DTOs (Freezed + json_serializable)
│   ├── mappers/               # Model → Entity mappers
│   └── repositories/          # Repository implementations
├── domain/
│   ├── entities/              # Pure business objects
│   ├── repositories/          # Repository contracts (abstract classes)
│   └── usecases/              # Use cases + params (Freezed)
└── presentation/
    ├── cubit/                 # Cubit + Freezed state
    ├── pages/                 # Page widgets (route targets)
    └── widgets/               # Reusable UI components for this feature
```

## Dependency Rule

Dependencies point **inward only**:

```
presentation → domain ← data
```

- `presentation` depends on `domain` (uses entities, use cases)
- `data` depends on `domain` (implements repository contracts)
- `domain` depends on **nothing** from internal layers (only Dart/Flutter core)

## Core Folder

Shared infrastructure lives in `lib/core/`:

```
core/
├── constants/         # App-wide constants
├── di/                # getIt + Injectable setup
├── error/             # AppException hierarchy + error mapper
├── extensions/        # Dart/Flutter extension methods
├── network/           # Dio client, interceptors, error mapper
├── result/            # Generic Result<T> union (Freezed)
├── router/            # go_router setup + route definitions
├── services/          # Crashlytics, Analytics wrappers
├── storage/           # SecureStorage + SharedPreferences abstractions
├── theme/             # Colors, text theme, ThemeData
├── usecase/           # Base UseCase<T, P> class
└── widgets/           # BlocBuilderX, BlocConsumerX, shared widgets
```

## Naming Conventions

| Item | Convention | Example |
|------|-----------|---------|
| Feature folder | `snake_case` | `features/login/` |
| Dart files | `snake_case` | `login_cubit.dart` |
| Classes | `PascalCase` | `LoginCubit` |
| Abstract classes | `PascalCase` (no prefix) | `LoginRepository` |
| Implementations | `PascalCase` + `Impl` suffix | `LoginRepositoryImpl` |
| Entities | `PascalCase` + `Entity` suffix | `UserEntity` |
| Models | `PascalCase` + `Model` suffix (or `Request`/`Response`) | `UserModel`, `LoginRequest` |
| Cubits | `PascalCase` + `Cubit` suffix | `LoginCubit` |
| States | `PascalCase` + `State` suffix | `LoginState` |
| Use cases | `PascalCase` + `UseCase` suffix | `LoginUseCase` |
| Params | `PascalCase` + `Params` suffix | `LoginParams` |
| Pages | `PascalCase` + `Page` suffix | `LoginPage` |
| Test files | `<original_file>_test.dart` | `login_cubit_test.dart` |

## Data Flow

```
UI (Page) → BlocBuilderX/BlocConsumerX → Cubit → UseCase → Repository → Datasource → API/Cache
```

Response flow:
```
API/Cache → Datasource → Model → Mapper → Entity → Repository(Result) → UseCase(Result) → Cubit → State → UI
```
