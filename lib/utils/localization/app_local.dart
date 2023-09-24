import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  final Locale locale;

  AppLocale(this.locale);

  static String? languageCode;

  static Map<String, String> _loadedLocalizedValues = {};

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future loadLang() async {
    String _langFile =
    await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    languageCode = locale.languageCode;
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues =
        _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated(String key) {
    return _loadedLocalizedValues[key] ?? 'Not found';
  }

  static String getTranslatedWithoutContext(String key) {
    return _loadedLocalizedValues[key] ?? 'Not found';
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar", "ru", "fr", "tr"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}

getLang(BuildContext context, String key) {
  return AppLocale.of(context).getTranslated(key);
}
