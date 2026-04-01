import 'package:onboarding_app/app/app_imports.dart';

class NameStep extends StatefulWidget {
  final String initialName;
  final void Function(String) onNameChanged;
  final VoidCallback onNext;

  const NameStep({
    super.key,
    required this.initialName,
    required this.onNameChanged,
    required this.onNext,
  });

  @override
  State<NameStep> createState() => _NameStepState();
}

class _NameStepState extends State<NameStep> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onNext();
    }
  }

  String? _validateName(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterFullName;
    }
    if (trimmed.length > 150) {
      return AppLocalizations.of(context)!.nameMaxLength;
    }
    // Allow Unicode letters, spaces, hyphens, apostrophes, periods.
    // This supports mononyms, diacritics, non-Latin scripts, hyphenated names.
    if (!RegExp(r"^[\p{L}\p{M} .'\-]+$", unicode: true).hasMatch(trimmed)) {
      return AppLocalizations.of(context)!.invalidNameCharacters;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MaterialSpacing(height: 3),
          Text(
            AppLocalizations.of(context)!.whatIsYourFullLegalName,
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          MaterialSpacing.heightMin(),
          Text(
            AppLocalizations.of(context)!.nameInstruction,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const MaterialSpacing(height: 4),
          OnboardingTextField(
            label: AppLocalizations.of(context)!.fullLegalNameLabel,
            hint: AppLocalizations.of(context)!.fullLegalNameHint,
            controller: _nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            autofocus: true,
            maxLength: 150,
            semanticsIdentifier: 'fullNameField',
            prefixIcon: const Icon(Icons.person_outline),
            validator: _validateName,
            onChanged: widget.onNameChanged,
            onFieldSubmitted: (_) => _handleNext(),
          ),
          MaterialSpacing.heightMin(),
          Text(
            AppLocalizations.of(context)!.nameSupportText,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: Semantics(
              identifier: 'nextButton',
              child: ElevatedButton(
                onPressed: _handleNext,
                child: Text(AppLocalizations.of(context)!.continueButton),
              ),
            ),
          ),
          MaterialSpacing.heightDefault(),
        ],
      ),
    );
  }
}
