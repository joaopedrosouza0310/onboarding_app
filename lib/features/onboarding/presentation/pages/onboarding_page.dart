import 'package:onboarding_app/app/app_imports.dart';
import 'package:onboarding_app/core/locale/locale_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  static const _totalSteps = 4;

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
          FocusScope.of(context).unfocus();
          _pageController.animateToPage(
            state.currentStep,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        if (state.isSubmitted) {
          context.go(AppRoutes.success);
        }
        if (state.isError && state.errorMessage != null) {
          context.showSnackBar(state.errorMessage!, isError: true);
        }
      },
      builder: (context, state, cubit) {
        return Scaffold(
          appBar: AppBar(
            leading: state.currentStep > 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: cubit.previousStep,
                    tooltip: AppLocalizations.of(context)!.goBackTooltip,
                  )
                : null,
            automaticallyImplyLeading: false,
            title: Text(AppLocalizations.of(context)!.profileSetupTitle),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.language),
                tooltip: AppLocalizations.of(context)!.languageMenuTooltip,
                onSelected: (code) {
                  context.read<LocaleCubit>().setLocale(Locale(code));
                },
                itemBuilder: (_) {
                  final current = context
                      .read<LocaleCubit>()
                      .state
                      .languageCode;
                  return [
                    PopupMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontWeight: current == 'en'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'es',
                      child: Text(
                        'Español',
                        style: TextStyle(
                          fontWeight: current == 'es'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'ru',
                      child: Text(
                        'Русский',
                        style: TextStyle(
                          fontWeight: current == 'ru'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'de',
                      child: Text(
                        'Deutsch',
                        style: TextStyle(
                          fontWeight: current == 'de'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ];
                },
              ),
              IconButton(
                icon: Icon(
                  context.theme.brightness == Brightness.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                tooltip: AppLocalizations.of(context)!.toggleThemeTooltip,
                onPressed: () =>
                    context.read<ThemeCubit>().toggleTheme(context),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                MaterialSpacing.heightDefault(),
                OnboardingProgressIndicator(
                  totalSteps: _totalSteps,
                  currentStep: state.currentStep,
                ),
                MaterialSpacing.heightDefault(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        NameStep(
                          initialName: state.fullName,
                          onNameChanged: cubit.updateFullName,
                          onNext: cubit.nextStep,
                        ),
                        DateOfBirthStep(
                          initialDob: state.dateOfBirth,
                          onDobChanged: cubit.updateDateOfBirth,
                          onNext: cubit.nextStep,
                          onBack: cubit.previousStep,
                        ),
                        AddressStep(
                          streetAddress: state.streetAddress,
                          city: state.city,
                          addressState: state.addressState,
                          postalCode: state.postalCode,
                          country: state.country,
                          suggestions: state.addressSuggestions,
                          isLoadingSuggestions:
                              state.isLoadingAddressSuggestions,
                          isAutocompleteAvailable:
                              state.isAddressAutocompleteAvailable,
                          suggestionsError: state.addressSuggestionsError,
                          onSearchChanged: cubit.searchAddress,
                          onSuggestionSelected: cubit.selectAddressSuggestion,
                          onStreetChanged: cubit.updateStreetAddress,
                          onCityChanged: cubit.updateCity,
                          onStateChanged: cubit.updateAddressState,
                          onPostalChanged: cubit.updatePostalCode,
                          onCountryChanged: cubit.updateCountry,
                          onNext: cubit.nextStep,
                          onBack: cubit.previousStep,
                        ),
                        ReviewStep(
                          data: state,
                          isSubmitting: state.isSubmitting,
                          onSubmit: cubit.submit,
                          onBack: cubit.previousStep,
                          onEditStep: cubit.goToStep,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
