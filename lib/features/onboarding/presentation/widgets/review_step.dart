import 'package:flutter/material.dart';
import 'package:onboarding_app/core/extensions/context_extensions.dart';
import 'package:onboarding_app/core/widgets/material_spacing.dart';
import 'package:onboarding_app/features/onboarding/presentation/cubit/onboarding_state.dart';

class ReviewStep extends StatelessWidget {
  final OnboardingState data;
  final bool isSubmitting;
  final VoidCallback onSubmit;
  final VoidCallback onBack;
  final void Function(int step) onEditStep;

  const ReviewStep({
    super.key,
    required this.data,
    required this.isSubmitting,
    required this.onSubmit,
    required this.onBack,
    required this.onEditStep,
  });

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const MaterialSpacing(height: 3),
                Text(
                  'Review your information',
                  style: context.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                MaterialSpacing.heightMin(),
                Text(
                  'Please confirm your details are correct before continuing.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const MaterialSpacing(height: 3),
                _ReviewSection(
                  title: 'Full legal name',
                  semanticsIdentifier: 'reviewSection_name',
                  onEdit: () => onEditStep(0),
                  children: [
                    _ReviewRow(
                      label: 'Name',
                      value: data.fullName,
                      semanticsIdentifier: 'reviewFullName',
                    ),
                  ],
                ),
                MaterialSpacing.heightDefault(),
                _ReviewSection(
                  title: 'Date of birth',
                  semanticsIdentifier: 'reviewSection_dob',
                  onEdit: () => onEditStep(1),
                  children: [
                    _ReviewRow(
                      label: 'Date of birth',
                      value: data.dateOfBirth != null
                          ? _formatDate(data.dateOfBirth!)
                          : '—',
                      semanticsIdentifier: 'reviewDateOfBirth',
                    ),
                  ],
                ),
                MaterialSpacing.heightDefault(),
                _ReviewSection(
                  title: 'Residential address',
                  semanticsIdentifier: 'reviewSection_address',
                  onEdit: () => onEditStep(2),
                  children: [
                    _ReviewRow(
                      label: 'Street',
                      value: data.streetAddress,
                      semanticsIdentifier: 'reviewStreetAddress',
                    ),
                    _ReviewRow(
                      label: 'City',
                      value: data.city,
                      semanticsIdentifier: 'reviewCity',
                    ),
                    if (data.addressState.isNotEmpty)
                      _ReviewRow(
                        label: 'State / Province',
                        value: data.addressState,
                        semanticsIdentifier: 'reviewState',
                      ),
                    _ReviewRow(
                      label: 'Postal code',
                      value: data.postalCode,
                      semanticsIdentifier: 'reviewPostalCode',
                    ),
                    _ReviewRow(
                      label: 'Country',
                      value: data.country,
                      semanticsIdentifier: 'reviewCountry',
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
                  onPressed: isSubmitting ? null : onBack,
                  child: const Text('Back'),
                ),
              ),
            ),
            MaterialSpacing.widthDefault(),
            Expanded(
              child: SizedBox(
                height: 50,
                child: Semantics(
                  identifier: 'submitButton',
                  child: ElevatedButton(
                    onPressed: isSubmitting ? null : onSubmit,
                    child: isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Confirm & Finish'),
                  ),
                ),
              ),
            ),
          ],
        ),
        MaterialSpacing.heightDefault(),
      ],
    );
  }
}

class _ReviewSection extends StatelessWidget {
  final String title;
  final String semanticsIdentifier;
  final VoidCallback onEdit;
  final List<Widget> children;

  const _ReviewSection({
    required this.title,
    required this.semanticsIdentifier,
    required this.onEdit,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Semantics(
          explicitChildNodes: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Semantics(
                    identifier: '${semanticsIdentifier}_editButton',
                    child: TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: const Text('Edit'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 16),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final String label;
  final String value;
  final String semanticsIdentifier;

  const _ReviewRow({
    required this.label,
    required this.value,
    required this.semanticsIdentifier,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            child: Semantics(
              identifier: semanticsIdentifier,
              child: Text(
                value.isEmpty ? '—' : value,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
