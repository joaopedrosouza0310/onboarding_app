// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profileSetupTitle => 'Profile Setup';

  @override
  String get goBackTooltip => 'Go back';

  @override
  String get toggleThemeTooltip => 'Toggle theme';

  @override
  String get whatIsYourFullLegalName => 'What is your full legal name?';

  @override
  String get nameInstruction =>
      'Enter your name exactly as it appears on your government-issued ID.';

  @override
  String get fullLegalNameLabel => 'Full legal name';

  @override
  String get fullLegalNameHint => 'e.g. María José García-López';

  @override
  String get nameSupportText =>
      'Supports all writing systems, mononyms, and hyphenated names.';

  @override
  String get continueButton => 'Continue';

  @override
  String get pleaseEnterFullName => 'Please enter your full name.';

  @override
  String get nameMaxLength => 'Name must be 150 characters or fewer.';

  @override
  String get invalidNameCharacters =>
      'Please use only letters, spaces, hyphens, apostrophes, or periods.';

  @override
  String get selectYourDateOfBirth => 'Select your date of birth';

  @override
  String get dateOfBirthLabel => 'Date of birth';

  @override
  String get dateOfBirthHint => 'MM/DD/YYYY';

  @override
  String get pleaseSelectYourDob => 'Please select your date of birth.';

  @override
  String get dobInFutureError => 'Date of birth cannot be in the future.';

  @override
  String minimumAgeError(Object minimumAge) {
    return 'You must be at least $minimumAge years old.';
  }

  @override
  String get invalidDateOfBirth => 'Please enter a valid date of birth.';

  @override
  String get whenWereYouBorn => 'When were you born?';

  @override
  String minimumAgeInstruction(Object minimumAge) {
    return 'You must be at least $minimumAge years old to proceed.';
  }

  @override
  String get tapToSelect => 'Tap to select';

  @override
  String ageLabel(Object age) {
    return 'Age: $age years';
  }

  @override
  String get youreAllSet => 'You\'re all set!';

  @override
  String get profileReady =>
      'Your profile has been successfully set up.\nWelcome aboard!';

  @override
  String get getStartedButton => 'Get Started';

  @override
  String get backButton => 'Back';

  @override
  String get submitButton => 'Submit';

  @override
  String get languageMenuTooltip => 'Change app language';

  @override
  String get whatIsYourResidentialAddress =>
      'What is your residential address?';

  @override
  String get addressSearchUnavailable =>
      'Address search is unavailable. Please enter your address manually.';

  @override
  String get streetAddress => 'Street address';

  @override
  String get streetAddressHint => '123 Main St';

  @override
  String get streetAddressRequired => 'Street address is required.';

  @override
  String get cityLabel => 'City';

  @override
  String get cityRequired => 'City is required.';

  @override
  String get stateProvinceLabel => 'State / Province';

  @override
  String get postalCodeLabel => 'Postal code';

  @override
  String get postalCodeRequired => 'Postal code is required.';

  @override
  String get countryLabel => 'Country';

  @override
  String get countryRequired => 'Country is required.';

  @override
  String get searchForYourAddress => 'Search for your address';

  @override
  String get startTypingAddress => 'Start typing your address…';

  @override
  String get reviewYourInformation => 'Review your information';

  @override
  String get confirmDetailsCorrect =>
      'Please confirm your details are correct before continuing.';

  @override
  String get fullLegalNameSection => 'Full legal name';

  @override
  String get nameLabel => 'Name';

  @override
  String get dateOfBirthSection => 'Date of birth';

  @override
  String get residentialAddressSection => 'Residential address';

  @override
  String get streetLabel => 'Street';

  @override
  String get confirmAndFinish => 'Confirm & Finish';
}
