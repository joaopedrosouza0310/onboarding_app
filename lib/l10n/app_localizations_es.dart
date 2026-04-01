// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get profileSetupTitle => 'Configuración del perfil';

  @override
  String get goBackTooltip => 'Regresar';

  @override
  String get toggleThemeTooltip => 'Cambiar tema';

  @override
  String get whatIsYourFullLegalName => '¿Cuál es su nombre completo legal?';

  @override
  String get nameInstruction =>
      'Ingrese su nombre exactamente como aparece en su identificación emitida por el gobierno.';

  @override
  String get fullLegalNameLabel => 'Nombre legal completo';

  @override
  String get fullLegalNameHint => 'p.ej. María José García-López';

  @override
  String get nameSupportText =>
      'Admite todos los sistemas de escritura, monónimos y nombres con guiones.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get pleaseEnterFullName => 'Por favor ingrese su nombre completo.';

  @override
  String get nameMaxLength => 'El nombre debe tener 150 caracteres o menos.';

  @override
  String get invalidNameCharacters =>
      'Use solo letras, espacios, guiones, apóstrofes o puntos.';

  @override
  String get selectYourDateOfBirth => 'Seleccione su fecha de nacimiento';

  @override
  String get dateOfBirthLabel => 'Fecha de nacimiento';

  @override
  String get dateOfBirthHint => 'DD/MM/AAAA';

  @override
  String get pleaseSelectYourDob =>
      'Por favor seleccione su fecha de nacimiento.';

  @override
  String get dobInFutureError =>
      'La fecha de nacimiento no puede ser en el futuro.';

  @override
  String minimumAgeError(Object minimumAge) {
    return 'Debe tener al menos $minimumAge años.';
  }

  @override
  String get invalidDateOfBirth =>
      'Por favor ingrese una fecha de nacimiento válida.';

  @override
  String get whenWereYouBorn => '¿Cuándo nació?';

  @override
  String minimumAgeInstruction(Object minimumAge) {
    return 'Debe tener al menos $minimumAge años para continuar.';
  }

  @override
  String get tapToSelect => 'Toque para seleccionar';

  @override
  String ageLabel(Object age) {
    return 'Edad: $age años';
  }

  @override
  String get youreAllSet => '¡Todo listo!';

  @override
  String get profileReady =>
      'Su perfil se ha configurado correctamente.\n¡Bienvenido!';

  @override
  String get getStartedButton => 'Comenzar';

  @override
  String get backButton => 'Atrás';

  @override
  String get submitButton => 'Enviar';

  @override
  String get languageMenuTooltip => 'Cambiar el idioma de la aplicación';

  @override
  String get whatIsYourResidentialAddress =>
      '¿Cuál es su dirección residencial?';

  @override
  String get addressSearchUnavailable =>
      'La búsqueda de direcciones no está disponible. Ingrese su dirección manualmente.';

  @override
  String get streetAddress => 'Dirección de la calle';

  @override
  String get streetAddressHint => '123 Calle Principal';

  @override
  String get streetAddressRequired => 'Se requiere la dirección de la calle.';

  @override
  String get cityLabel => 'Ciudad';

  @override
  String get cityRequired => 'Se requiere la ciudad.';

  @override
  String get stateProvinceLabel => 'Estado / Provincia';

  @override
  String get postalCodeLabel => 'Código postal';

  @override
  String get postalCodeRequired => 'Se requiere el código postal.';

  @override
  String get countryLabel => 'País';

  @override
  String get countryRequired => 'Se requiere el país.';

  @override
  String get searchForYourAddress => 'Busque su dirección';

  @override
  String get startTypingAddress => 'Comience a escribir su dirección…';

  @override
  String get reviewYourInformation => 'Revise su información';

  @override
  String get confirmDetailsCorrect =>
      'Confirme que sus detalles sean correctos antes de continuar.';

  @override
  String get fullLegalNameSection => 'Nombre legal completo';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get dateOfBirthSection => 'Fecha de nacimiento';

  @override
  String get residentialAddressSection => 'Dirección residencial';

  @override
  String get streetLabel => 'Calle';

  @override
  String get confirmAndFinish => 'Confirmar y Finalizar';
}
