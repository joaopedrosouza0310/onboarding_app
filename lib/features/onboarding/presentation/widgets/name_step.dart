import 'package:flutter/material.dart';
import 'package:onboarding_app/core/extensions/context_extensions.dart';
import 'package:onboarding_app/core/widgets/material_spacing.dart';
import 'package:onboarding_app/features/onboarding/presentation/widgets/onboarding_text_field.dart';

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
    if (trimmed.isEmpty) return 'Please enter your full name.';
    if (trimmed.length > 150) return 'Name must be 150 characters or fewer.';
    // Allow Unicode letters, spaces, hyphens, apostrophes, periods.
    // This supports mononyms, diacritics, non-Latin scripts, hyphenated names.
    if (!RegExp(r"^[\p{L}\p{M} .'\-]+$", unicode: true).hasMatch(trimmed)) {
      return 'Please use only letters, spaces, hyphens, apostrophes, or periods.';
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
          MaterialSpacing(height: 3),
          Text(
            'What is your full legal name?',
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          MaterialSpacing.heightMin(),
          Text(
            'Enter your name exactly as it appears on your government-issued ID.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          MaterialSpacing(height: 4),
          OnboardingTextField(
            label: 'Full legal name',
            hint: 'e.g. María José García-López',
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
            'Supports all writing systems, mononyms, and hyphenated names.',
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
                child: const Text('Continue'),
              ),
            ),
          ),
          MaterialSpacing.heightDefault(),
        ],
      ),
    );
  }
}
