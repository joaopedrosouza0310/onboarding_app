import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('ru'),
    Locale('de'),
  ];

  /// No description provided for @profileSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Setup'**
  String get profileSetupTitle;

  /// No description provided for @goBackTooltip.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBackTooltip;

  /// No description provided for @toggleThemeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get toggleThemeTooltip;

  /// No description provided for @whatIsYourFullLegalName.
  ///
  /// In en, this message translates to:
  /// **'What is your full legal name?'**
  String get whatIsYourFullLegalName;

  /// No description provided for @nameInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your name exactly as it appears on your government-issued ID.'**
  String get nameInstruction;

  /// No description provided for @fullLegalNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full legal name'**
  String get fullLegalNameLabel;

  /// No description provided for @fullLegalNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. María José García-López'**
  String get fullLegalNameHint;

  /// No description provided for @nameSupportText.
  ///
  /// In en, this message translates to:
  /// **'Supports all writing systems, mononyms, and hyphenated names.'**
  String get nameSupportText;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @pleaseEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name.'**
  String get pleaseEnterFullName;

  /// No description provided for @nameMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be 150 characters or fewer.'**
  String get nameMaxLength;

  /// No description provided for @invalidNameCharacters.
  ///
  /// In en, this message translates to:
  /// **'Please use only letters, spaces, hyphens, apostrophes, or periods.'**
  String get invalidNameCharacters;

  /// No description provided for @selectYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Select your date of birth'**
  String get selectYourDateOfBirth;

  /// No description provided for @dateOfBirthLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirthLabel;

  /// No description provided for @dateOfBirthHint.
  ///
  /// In en, this message translates to:
  /// **'MM/DD/YYYY'**
  String get dateOfBirthHint;

  /// No description provided for @pleaseSelectYourDob.
  ///
  /// In en, this message translates to:
  /// **'Please select your date of birth.'**
  String get pleaseSelectYourDob;

  /// No description provided for @dobInFutureError.
  ///
  /// In en, this message translates to:
  /// **'Date of birth cannot be in the future.'**
  String get dobInFutureError;

  /// No description provided for @minimumAgeError.
  ///
  /// In en, this message translates to:
  /// **'You must be at least {minimumAge} years old.'**
  String minimumAgeError(Object minimumAge);

  /// No description provided for @invalidDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid date of birth.'**
  String get invalidDateOfBirth;

  /// No description provided for @whenWereYouBorn.
  ///
  /// In en, this message translates to:
  /// **'When were you born?'**
  String get whenWereYouBorn;

  /// No description provided for @minimumAgeInstruction.
  ///
  /// In en, this message translates to:
  /// **'You must be at least {minimumAge} years old to proceed.'**
  String minimumAgeInstruction(Object minimumAge);

  /// No description provided for @tapToSelect.
  ///
  /// In en, this message translates to:
  /// **'Tap to select'**
  String get tapToSelect;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age: {age} years'**
  String ageLabel(Object age);

  /// No description provided for @youreAllSet.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get youreAllSet;

  /// No description provided for @profileReady.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been successfully set up.\nWelcome aboard!'**
  String get profileReady;

  /// No description provided for @getStartedButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStartedButton;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @submitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButton;

  /// No description provided for @languageMenuTooltip.
  ///
  /// In en, this message translates to:
  /// **'Change app language'**
  String get languageMenuTooltip;

  /// No description provided for @whatIsYourResidentialAddress.
  ///
  /// In en, this message translates to:
  /// **'What is your residential address?'**
  String get whatIsYourResidentialAddress;

  /// No description provided for @addressSearchUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Address search is unavailable. Please enter your address manually.'**
  String get addressSearchUnavailable;

  /// No description provided for @streetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street address'**
  String get streetAddress;

  /// No description provided for @streetAddressHint.
  ///
  /// In en, this message translates to:
  /// **'123 Main St'**
  String get streetAddressHint;

  /// No description provided for @streetAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Street address is required.'**
  String get streetAddressRequired;

  /// No description provided for @cityLabel.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// No description provided for @cityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required.'**
  String get cityRequired;

  /// No description provided for @stateProvinceLabel.
  ///
  /// In en, this message translates to:
  /// **'State / Province'**
  String get stateProvinceLabel;

  /// No description provided for @postalCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get postalCodeLabel;

  /// No description provided for @postalCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Postal code is required.'**
  String get postalCodeRequired;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @countryRequired.
  ///
  /// In en, this message translates to:
  /// **'Country is required.'**
  String get countryRequired;

  /// No description provided for @searchForYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Search for your address'**
  String get searchForYourAddress;

  /// No description provided for @startTypingAddress.
  ///
  /// In en, this message translates to:
  /// **'Start typing your address…'**
  String get startTypingAddress;

  /// No description provided for @reviewYourInformation.
  ///
  /// In en, this message translates to:
  /// **'Review your information'**
  String get reviewYourInformation;

  /// No description provided for @confirmDetailsCorrect.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your details are correct before continuing.'**
  String get confirmDetailsCorrect;

  /// No description provided for @fullLegalNameSection.
  ///
  /// In en, this message translates to:
  /// **'Full legal name'**
  String get fullLegalNameSection;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @dateOfBirthSection.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirthSection;

  /// No description provided for @residentialAddressSection.
  ///
  /// In en, this message translates to:
  /// **'Residential address'**
  String get residentialAddressSection;

  /// No description provided for @streetLabel.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get streetLabel;

  /// No description provided for @confirmAndFinish.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Finish'**
  String get confirmAndFinish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
