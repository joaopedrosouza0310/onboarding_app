# Cubit Usage Standards

## Rules

1. **Use Cubit only** — never use Bloc events.
2. **Cubits are injectable** — annotate with `@injectable`.
3. **Never use BlocProvider** — Cubits are resolved through `getIt`.
4. **Use BlocBuilderX / BlocConsumerX** — custom wrappers that resolve cubit from getIt.
5. **State is a single Freezed data class** — not a sealed union.
6. **Update state via `emit(state.copyWith(...))` directly** — never replace state wholesale.

## State Design

States use a **single `@freezed` data class** with fields for every possible
piece of UI data, including async flags:

```dart
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
    UserEntity? user,
  }) = _LoginState;
}
```

### Field naming conventions:
- `isLoading` — async operation in progress
- `isError` — last operation failed
- `errorMessage` — user-friendly error copy (nullable)
- `isSuccess` / `isXxxCompleted` — terminal success state (when needed for side-effects)
- Domain payload fields alongside the flags (e.g. `UserEntity? user`)

> **Why not sealed unions?**
> A sealed `initial/loading/success/failure` union forces exhaustive matching
> everywhere and makes partial updates awkward. A data class lets you express
> "still showing the form but now with an error banner" naturally with
> `state.copyWith(isError: true, errorMessage: 'Bad email')` without re-supplying
> every other field.

## State mutations

Call `emit(state.copyWith(...))` directly for every mutation:

```dart
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final result = await _loginUseCase(LoginParams(email: email, password: password));

    result.when(
      success: (user) =>
          emit(state.copyWith(isLoading: false, user: user)),
      failure: (failure) {
        final message = failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg ?? 'Network error',
          cache: (msg) => msg ?? 'Cache error',
          auth: (msg) => msg ?? 'Authentication error',
          unknown: (msg) => msg ?? 'An unexpected error occurred',
        );
        emit(state.copyWith(isLoading: false, isError: true, errorMessage: message));
      },
    );
  }
}
```

## UI Usage — BlocBuilderX

```dart
BlocBuilderX<LoginCubit, LoginState>(
  builder: (context, state, cubit) {
    return LoginForm(
      isLoading: state.isLoading,
      errorMessage: state.isError ? state.errorMessage : null,
      onLogin: cubit.login,
    );
  },
)
```

## UI Usage — BlocConsumerX

When side-effects (navigation, snackbar) are triggered by a flag:

```dart
BlocConsumerX<LoginCubit, LoginState>(
  listenWhen: (prev, curr) =>
      prev.user != curr.user || prev.isError != curr.isError,
  listener: (context, state, cubit) {
    if (state.user != null) context.go(AppRoutes.home);
    if (state.isError && state.errorMessage != null) {
      context.showSnackBar(state.errorMessage!, isError: true);
    }
  },
  builder: (context, state, cubit) {
    return LoginForm(isLoading: state.isLoading, onLogin: cubit.login);
  },
)
```

## StatefulWidget pages (multi-step flows with PageView)

When a page needs a `PageController`, annotate the cubit with `@lazySingleton`
so `BlocConsumerX` always resolves the same instance across rebuilds.

```dart
// cubit
@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> { ... }

// page
class OnboardingPage extends StatefulWidget { ... }

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumerX<OnboardingCubit, OnboardingState>(
      listener: (context, state, cubit) {
        if (_pageController.hasClients &&
            _pageController.page?.round() != state.currentStep) {
          _pageController.animateToPage(
            state.currentStep,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        if (state.isSubmitted) context.showSnackBar('Done!');
      },
      builder: (context, state, cubit) {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [ StepA(...), StepB(...) ],
          ),
        );
      },
    );
  }
}
```

## Key Points

- The cubit instance always comes from `getIt`, never from `BlocProvider`.
- Call `emit(state.copyWith(...))` for every mutation — never `emit(MyState(...))`.
- Use `listenWhen` in consumers to avoid redundant listener calls.
- Prefer `state.fieldName` checks in listeners over pattern matching.
