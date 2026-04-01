import 'package:onboarding_app/app/app_imports.dart';

class DateOfBirthStep extends StatefulWidget {
  final DateTime? initialDob;
  final void Function(DateTime) onDobChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const DateOfBirthStep({
    super.key,
    required this.initialDob,
    required this.onDobChanged,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<DateOfBirthStep> createState() => _DateOfBirthStepState();
}

class _DateOfBirthStepState extends State<DateOfBirthStep> {
  DateTime? _selectedDate;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDob;
  }

  DateTime get _maxDate => DateTime.now();

  DateTime get _minDate {
    final now = DateTime.now();
    return DateTime(
      now.year - OnboardingConstants.maximumAge,
      now.month,
      now.day,
    );
  }

  DateTime get _initialPickerDate {
    if (_selectedDate != null) return _selectedDate!;
    final now = DateTime.now();
    return DateTime(
      now.year - OnboardingConstants.defaultPickerYearsAgo,
      now.month,
      now.day,
    );
  }

  Future<void> _openPicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _initialPickerDate,
      firstDate: _minDate,
      lastDate: _maxDate,
      helpText: AppLocalizations.of(context)!.selectYourDateOfBirth,
      fieldLabelText: AppLocalizations.of(context)!.dateOfBirthLabel,
      fieldHintText: AppLocalizations.of(context)!.dateOfBirthHint,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _errorText = _validate(picked);
      });
      if (_errorText == null) widget.onDobChanged(picked);
    }
  }

  String? _validate(DateTime? date) {
    if (date == null) return AppLocalizations.of(context)!.pleaseSelectYourDob;
    if (date.isAfter(DateTime.now())) {
      return AppLocalizations.of(context)!.dobInFutureError;
    }
    final age = _ageFromDob(date);
    if (age < OnboardingConstants.minimumAge) {
      return AppLocalizations.of(
        context,
      )!.minimumAgeError(OnboardingConstants.minimumAge);
    }
    if (age > OnboardingConstants.maximumAge) {
      return AppLocalizations.of(context)!.invalidDateOfBirth;
    }
    return null;
  }

  int _ageFromDob(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

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

  void _handleNext() {
    final error = _validate(_selectedDate);
    setState(() => _errorText = error);
    if (error == null) widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const MaterialSpacing(height: 3),
        Text(
          AppLocalizations.of(context)!.whenWereYouBorn,
          style: context.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        MaterialSpacing.heightMin(),
        Text(
          AppLocalizations.of(
            context,
          )!.minimumAgeInstruction(OnboardingConstants.minimumAge),
          style: context.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
        const MaterialSpacing(height: 4),
        Semantics(
          identifier: 'dobPickerButton',
          label: _selectedDate != null
              ? 'Date of birth: ${_formatDate(_selectedDate!)}'
              : 'Select date of birth',
          button: true,
          onTap: _openPicker,
          child: InkWell(
            onTap: _openPicker,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.dateOfBirthLabel,
                prefixIcon: const Icon(Icons.calendar_today_outlined),
                errorText: _errorText,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              ),
              child: Text(
                _selectedDate != null
                    ? _formatDate(_selectedDate!)
                    : AppLocalizations.of(context)!.tapToSelect,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: _selectedDate != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ),
        if (_selectedDate != null && _errorText == null) ...[
          MaterialSpacing.heightMin(),
          Text(
            AppLocalizations.of(context)!.ageLabel(_ageFromDob(_selectedDate!)),
            style: context.textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
        const Spacer(),
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
    );
  }
}
