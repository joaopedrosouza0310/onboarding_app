// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get profileSetupTitle => 'Настройка профиля';

  @override
  String get goBackTooltip => 'Назад';

  @override
  String get toggleThemeTooltip => 'Переключить тему';

  @override
  String get whatIsYourFullLegalName => 'Каково ваше полное юридическое имя?';

  @override
  String get nameInstruction =>
      'Введите свое имя точно так, как оно указано в документе, выданном государством.';

  @override
  String get fullLegalNameLabel => 'Полное юридическое имя';

  @override
  String get fullLegalNameHint => 'например, Мария Хосе Гарсия-Лопес';

  @override
  String get nameSupportText =>
      'Поддерживает все системы письма, моннонимы и имена с дефисом.';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get pleaseEnterFullName => 'Пожалуйста, введите полное имя.';

  @override
  String get nameMaxLength => 'Имя должно содержать не более 150 символов.';

  @override
  String get invalidNameCharacters =>
      'Используйте только буквы, пробелы, дефисы, апострофы или точки.';

  @override
  String get selectYourDateOfBirth => 'Выберите дату рождения';

  @override
  String get dateOfBirthLabel => 'Дата рождения';

  @override
  String get dateOfBirthHint => 'ДД/ММ/ГГГГ';

  @override
  String get pleaseSelectYourDob => 'Пожалуйста, выберите дату рождения.';

  @override
  String get dobInFutureError => 'Дата рождения не может быть в будущем.';

  @override
  String minimumAgeError(Object minimumAge) {
    return 'Вам должно быть не менее $minimumAge лет.';
  }

  @override
  String get invalidDateOfBirth =>
      'Пожалуйста, введите действительную дату рождения.';

  @override
  String get whenWereYouBorn => 'Когда вы родились?';

  @override
  String minimumAgeInstruction(Object minimumAge) {
    return 'Вы должны быть не моложе $minimumAge лет, чтобы продолжить.';
  }

  @override
  String get tapToSelect => 'Нажмите, чтобы выбрать';

  @override
  String ageLabel(Object age) {
    return 'Возраст: $age лет';
  }

  @override
  String get youreAllSet => 'Все готово!';

  @override
  String get profileReady => 'Ваш профиль успешно настроен.\nДобро пожаловать!';

  @override
  String get getStartedButton => 'Начать';

  @override
  String get backButton => 'Назад';

  @override
  String get submitButton => 'Отправить';

  @override
  String get languageMenuTooltip => 'Изменить язык приложения';

  @override
  String get whatIsYourResidentialAddress => 'Какой ваш жилой адрес?';

  @override
  String get addressSearchUnavailable =>
      'Поиск адреса недоступен. Пожалуйста, введите свой адрес вручную.';

  @override
  String get streetAddress => 'Адрес улицы';

  @override
  String get streetAddressHint => '123 Главная улица';

  @override
  String get streetAddressRequired => 'Требуется адрес улицы.';

  @override
  String get cityLabel => 'Город';

  @override
  String get cityRequired => 'Требуется город.';

  @override
  String get stateProvinceLabel => 'Штат / Провинция';

  @override
  String get postalCodeLabel => 'Почтовый индекс';

  @override
  String get postalCodeRequired => 'Требуется почтовый индекс.';

  @override
  String get countryLabel => 'Страна';

  @override
  String get countryRequired => 'Требуется страна.';

  @override
  String get searchForYourAddress => 'Поиск вашего адреса';

  @override
  String get startTypingAddress => 'Начните вводить свой адрес…';

  @override
  String get reviewYourInformation => 'Проверьте вашу информацию';

  @override
  String get confirmDetailsCorrect =>
      'Пожалуйста, подтвердите, что ваши данные верны, прежде чем продолжить.';

  @override
  String get fullLegalNameSection => 'Полное юридическое имя';

  @override
  String get nameLabel => 'Имя';

  @override
  String get dateOfBirthSection => 'Дата рождения';

  @override
  String get residentialAddressSection => 'Жилой адрес';

  @override
  String get streetLabel => 'Улица';

  @override
  String get confirmAndFinish => 'Подтвердить и завершить';
}
