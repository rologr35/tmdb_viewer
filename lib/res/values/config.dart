import 'package:intl/intl.dart';

enum AppLocale { es, en }

extension AppLocaleCode on AppLocale {
  String get localeCode => switch(this) {
    AppLocale.es => "es",
    AppLocale.en => "en",
  };
}

class AppConfig {

  static AppLocale get locale => Intl.getCurrentLocale().contains("es") ? AppLocale.es : AppLocale.en;

}
