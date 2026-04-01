import 'dart:async';

import 'package:onboarding_app/app/app_imports.dart';

class AddressStep extends StatefulWidget {
  final String streetAddress;
  final String city;
  final String addressState;
  final String postalCode;
  final String country;
  final List<AddressSuggestionEntity> suggestions;
  final bool isLoadingSuggestions;
  final bool isAutocompleteAvailable;
  final String? suggestionsError;
  final void Function(String) onSearchChanged;
  final void Function(AddressSuggestionEntity) onSuggestionSelected;
  final void Function(String) onStreetChanged;
  final void Function(String) onCityChanged;
  final void Function(String) onStateChanged;
  final void Function(String) onPostalChanged;
  final void Function(String) onCountryChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const AddressStep({
    super.key,
    required this.streetAddress,
    required this.city,
    required this.addressState,
    required this.postalCode,
    required this.country,
    required this.suggestions,
    required this.isLoadingSuggestions,
    required this.isAutocompleteAvailable,
    required this.suggestionsError,
    required this.onSearchChanged,
    required this.onSuggestionSelected,
    required this.onStreetChanged,
    required this.onCityChanged,
    required this.onStateChanged,
    required this.onPostalChanged,
    required this.onCountryChanged,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _searchController;
  late final TextEditingController _streetController;
  late final TextEditingController _cityController;
  late final TextEditingController _stateController;
  late final TextEditingController _postalController;
  late final TextEditingController _countryController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _streetController = TextEditingController(text: widget.streetAddress);
    _cityController = TextEditingController(text: widget.city);
    _stateController = TextEditingController(text: widget.addressState);
    _postalController = TextEditingController(text: widget.postalCode);
    _countryController = TextEditingController(text: widget.country);
  }

  @override
  void didUpdateWidget(AddressStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync controllers when cubit fills address fields from autocomplete.
    if (oldWidget.streetAddress != widget.streetAddress) {
      _streetController.text = widget.streetAddress;
    }
    if (oldWidget.city != widget.city) {
      _cityController.text = widget.city;
    }
    if (oldWidget.addressState != widget.addressState) {
      _stateController.text = widget.addressState;
    }
    if (oldWidget.postalCode != widget.postalCode) {
      _postalController.text = widget.postalCode;
    }
    if (oldWidget.country != widget.country) {
      _countryController.text = widget.country;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      widget.onSearchChanged(value);
    });
  }

  void _handleNext() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MaterialSpacing(height: 3),
                  Text(
                    AppLocalizations.of(context)!.whatIsYourResidentialAddress,
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const MaterialSpacing(height: 4),
                  if (widget.isAutocompleteAvailable) ...[
                    _SearchField(
                      controller: _searchController,
                      isLoading: widget.isLoadingSuggestions,
                      onChanged: _onSearchChanged,
                    ),
                    if (widget.suggestions.isNotEmpty)
                      _SuggestionList(
                        suggestions: widget.suggestions,
                        onSelected: (suggestion) {
                          _searchController.clear();
                          widget.onSuggestionSelected(suggestion);
                        },
                      ),
                    if (widget.suggestionsError != null)
                      _AutocompleteUnavailableBanner(
                        message: widget.suggestionsError!,
                      ),
                    MaterialSpacing.heightDefault(),
                    const Divider(),
                    MaterialSpacing.heightMin(),
                  ] else ...[
                    _AutocompleteUnavailableBanner(
                      message:
                          widget.suggestionsError ??
                          AppLocalizations.of(
                            context,
                          )!.addressSearchUnavailable,
                    ),
                    MaterialSpacing.heightDefault(),
                  ],
                  OnboardingTextField(
                    label: AppLocalizations.of(context)!.streetAddress,
                    hint: AppLocalizations.of(context)!.streetAddressHint,
                    controller: _streetController,
                    semanticsIdentifier: 'streetAddressField',
                    prefixIcon: const Icon(Icons.home_outlined),
                    validator: (v) => (v?.trim().isEmpty ?? true)
                        ? AppLocalizations.of(context)!.streetAddressRequired
                        : null,
                    onChanged: widget.onStreetChanged,
                  ),
                  MaterialSpacing.heightDefault(),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: OnboardingTextField(
                          label: AppLocalizations.of(context)!.cityLabel,
                          controller: _cityController,
                          semanticsIdentifier: 'cityField',
                          validator: (v) => (v?.trim().isEmpty ?? true)
                              ? AppLocalizations.of(context)!.cityRequired
                              : null,
                          onChanged: widget.onCityChanged,
                        ),
                      ),
                      const MaterialSpacing(width: 1.5),
                      Expanded(
                        child: OnboardingTextField(
                          label: AppLocalizations.of(
                            context,
                          )!.stateProvinceLabel,
                          controller: _stateController,
                          semanticsIdentifier: 'stateField',
                          onChanged: widget.onStateChanged,
                        ),
                      ),
                    ],
                  ),
                  MaterialSpacing.heightDefault(),
                  Row(
                    children: [
                      Expanded(
                        child: OnboardingTextField(
                          label: AppLocalizations.of(context)!.postalCodeLabel,
                          controller: _postalController,
                          semanticsIdentifier: 'postalCodeField',
                          keyboardType: TextInputType.number,
                          validator: (v) => (v?.trim().isEmpty ?? true)
                              ? AppLocalizations.of(context)!.postalCodeRequired
                              : null,
                          onChanged: widget.onPostalChanged,
                        ),
                      ),
                      const MaterialSpacing(width: 1.5),
                      Expanded(
                        flex: 2,
                        child: OnboardingTextField(
                          label: AppLocalizations.of(context)!.countryLabel,
                          controller: _countryController,
                          semanticsIdentifier: 'countryField',
                          validator: (v) => (v?.trim().isEmpty ?? true)
                              ? AppLocalizations.of(context)!.countryRequired
                              : null,
                          onChanged: widget.onCountryChanged,
                        ),
                      ),
                    ],
                  ),
                  const MaterialSpacing(height: 3),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Semantics(
                  identifier: 'backButton',
                  child: OutlinedButton(
                    onPressed: widget.onBack,
                    child: Text(AppLocalizations.of(context)!.backButton),
                  ),
                ),
              ),
              MaterialSpacing.widthDefault(),
              Expanded(
                child: Semantics(
                  identifier: 'nextButton',
                  child: ElevatedButton(
                    onPressed: _handleNext,
                    child: Text(AppLocalizations.of(context)!.continueButton),
                  ),
                ),
              ),
            ],
          ),
          MaterialSpacing.heightDefault(),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final void Function(String) onChanged;

  const _SearchField({
    required this.controller,
    required this.isLoading,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'addressSearchField',
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.searchForYourAddress,
          hintText: AppLocalizations.of(context)!.startTypingAddress,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  final List<AddressSuggestionEntity> suggestions;
  final void Function(AddressSuggestionEntity) onSelected;

  const _SuggestionList({required this.suggestions, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 4),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: suggestions.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            dense: true,
            leading: const Icon(Icons.place_outlined, size: 18),
            title: Text(
              suggestion.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () => onSelected(suggestion),
          );
        },
      ),
    );
  }
}

class _AutocompleteUnavailableBanner extends StatelessWidget {
  final String message;

  const _AutocompleteUnavailableBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 16,
            color: colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
