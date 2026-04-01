import 'package:onboarding_app/app/app_imports.dart';

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
                  AppLocalizations.of(context)!.reviewYourInformation,
                  style: context.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                MaterialSpacing.heightMin(),
                Text(
                  AppLocalizations.of(context)!.confirmDetailsCorrect,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const MaterialSpacing(height: 3),
                _ReviewSection(
                  title: AppLocalizations.of(context)!.fullLegalNameSection,
                  semanticsIdentifier: 'reviewSection_name',
                  onEdit: () => onEditStep(0),
                  children: [
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.nameLabel,
                      value: data.fullName,
                      semanticsIdentifier: 'reviewFullName',
                    ),
                  ],
                ),
                MaterialSpacing.heightDefault(),
                _ReviewSection(
                  title: AppLocalizations.of(context)!.dateOfBirthSection,
                  semanticsIdentifier: 'reviewSection_dob',
                  onEdit: () => onEditStep(1),
                  children: [
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.dateOfBirthLabel,
                      value: data.dateOfBirth != null
                          ? _formatDate(data.dateOfBirth!)
                          : '—',
                      semanticsIdentifier: 'reviewDateOfBirth',
                    ),
                  ],
                ),
                MaterialSpacing.heightDefault(),
                _ReviewSection(
                  title: AppLocalizations.of(
                    context,
                  )!.residentialAddressSection,
                  semanticsIdentifier: 'reviewSection_address',
                  onEdit: () => onEditStep(2),
                  children: [
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.streetLabel,
                      value: data.streetAddress,
                      semanticsIdentifier: 'reviewStreetAddress',
                    ),
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.cityLabel,
                      value: data.city,
                      semanticsIdentifier: 'reviewCity',
                    ),
                    if (data.addressState.isNotEmpty)
                      _ReviewRow(
                        label: AppLocalizations.of(context)!.stateProvinceLabel,
                        value: data.addressState,
                        semanticsIdentifier: 'reviewState',
                      ),
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.postalCodeLabel,
                      value: data.postalCode,
                      semanticsIdentifier: 'reviewPostalCode',
                    ),
                    _ReviewRow(
                      label: AppLocalizations.of(context)!.countryLabel,
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
                  child: Text(AppLocalizations.of(context)!.backButton),
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
                        : Text(AppLocalizations.of(context)!.confirmAndFinish),
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
