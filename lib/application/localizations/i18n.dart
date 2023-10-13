import 'dart:convert';

import 'package:desafio_flutter_urbetrack/application/localizations/locales.dart';
import 'package:desafio_flutter_urbetrack/infrastructure/environments_confi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class I18n {
  final Locale _locale;
  Map<String, String> _sentences = {};
  I18n(
    this._locale,
  );

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n)!;
  }

  Future<I18n> load() async {
    final data = await _loadData();
    final Map<String, dynamic> result = json.decode(data);
    _sentences = {};
    result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });
    return I18n(_locale);
  }

  Future<String> _loadData() async {
    try {
      return await rootBundle
          .loadString('assets/i18n/${_locale.languageCode}.json');
    } catch (_) {
      return await rootBundle
          .loadString('assets/i18n/${EnvironmentConfig.defaultLanguage}.json');
    }
  }

  String translate(String key, {String? defaultValue}) {
    final text = _sentences[key];
    return text ?? defaultValue ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<I18n> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Locales.suportedLanguages
        .map((e) => e.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<I18n> load(Locale locale) async {
    final localizations = I18n(
      locale,
    );
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
