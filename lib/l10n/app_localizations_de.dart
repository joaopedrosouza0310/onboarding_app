// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get profileSetupTitle => 'Profil einrichten';

  @override
  String get goBackTooltip => 'Zurück';

  @override
  String get toggleThemeTooltip => 'Thema wechseln';

  @override
  String get whatIsYourFullLegalName =>
      'Wie ist Ihr vollständiger offizieller Name?';

  @override
  String get nameInstruction =>
      'Geben Sie Ihren Namen genau so ein, wie er in Ihrem amtlichen Ausweis steht.';

  @override
  String get fullLegalNameLabel => 'Vollständiger offizieller Name';

  @override
  String get fullLegalNameHint => 'z. B. María José García-López';

  @override
  String get nameSupportText =>
      'Unterstützt alle Schriftsysteme, Mononyme und Bindestrichnamen.';

  @override
  String get continueButton => 'Weiter';

  @override
  String get pleaseEnterFullName =>
      'Bitte geben Sie Ihren vollständigen Namen ein.';

  @override
  String get nameMaxLength => 'Der Name darf maximal 150 Zeichen lang sein.';

  @override
  String get invalidNameCharacters =>
      'Bitte verwenden Sie nur Buchstaben, Leerzeichen, Bindestriche, Apostrophe oder Punkte.';

  @override
  String get selectYourDateOfBirth => 'Wählen Sie Ihr Geburtsdatum aus';

  @override
  String get dateOfBirthLabel => 'Geburtsdatum';

  @override
  String get dateOfBirthHint => 'TT/MM/JJJJ';

  @override
  String get pleaseSelectYourDob => 'Bitte wählen Sie Ihr Geburtsdatum aus.';

  @override
  String get dobInFutureError =>
      'Geburtsdatum darf nicht in der Zukunft liegen.';

  @override
  String minimumAgeError(Object minimumAge) {
    return 'Sie müssen mindestens $minimumAge Jahre alt sein.';
  }

  @override
  String get invalidDateOfBirth =>
      'Bitte geben Sie ein gültiges Geburtsdatum ein.';

  @override
  String get whenWereYouBorn => 'Wann wurden Sie geboren?';

  @override
  String minimumAgeInstruction(Object minimumAge) {
    return 'Sie müssen mindestens $minimumAge Jahre alt sein, um fortzufahren.';
  }

  @override
  String get tapToSelect => 'Zum Auswählen antippen';

  @override
  String ageLabel(Object age) {
    return 'Alter: $age Jahre';
  }

  @override
  String get youreAllSet => 'Sie sind startklar!';

  @override
  String get profileReady =>
      'Ihr Profil wurde erfolgreich eingerichtet.\nWillkommen an Bord!';

  @override
  String get getStartedButton => 'Loslegen';

  @override
  String get backButton => 'Zurück';

  @override
  String get submitButton => 'Absenden';

  @override
  String get languageMenuTooltip => 'Sprache der App ändern';

  @override
  String get whatIsYourResidentialAddress => 'Wie lautet Ihre Wohnadresse?';

  @override
  String get addressSearchUnavailable =>
      'Adressensuche ist nicht verfügbar. Bitte geben Sie Ihre Adresse manuell ein.';

  @override
  String get streetAddress => 'Straßenadresse';

  @override
  String get streetAddressHint => '123 Hauptstraße';

  @override
  String get streetAddressRequired => 'Straßenadresse ist erforderlich.';

  @override
  String get cityLabel => 'Stadt';

  @override
  String get cityRequired => 'Stadt ist erforderlich.';

  @override
  String get stateProvinceLabel => 'Bundesland / Provinz';

  @override
  String get postalCodeLabel => 'Postleitzahl';

  @override
  String get postalCodeRequired => 'Postleitzahl ist erforderlich.';

  @override
  String get countryLabel => 'Land';

  @override
  String get countryRequired => 'Land ist erforderlich.';

  @override
  String get searchForYourAddress => 'Suchen Sie Ihre Adresse';

  @override
  String get startTypingAddress => 'Beginnen Sie, Ihre Adresse einzugeben…';

  @override
  String get reviewYourInformation => 'Überprüfen Sie Ihre Informationen';

  @override
  String get confirmDetailsCorrect =>
      'Bitte bestätigen Sie, dass Ihre Angaben korrekt sind, bevor Sie fortfahren.';

  @override
  String get fullLegalNameSection => 'Vollständiger offizieller Name';

  @override
  String get nameLabel => 'Name';

  @override
  String get dateOfBirthSection => 'Geburtsdatum';

  @override
  String get residentialAddressSection => 'Wohnadresse';

  @override
  String get streetLabel => 'Straße';

  @override
  String get confirmAndFinish => 'Bestätigen und Abschließen';
}
