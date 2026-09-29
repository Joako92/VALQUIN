import 'package:flutter/material.dart';
import 'package:valquin/persistence/app_settings_storage.dart';

import 'app_colors.dart';
import '../localization/language.dart';

import 'app_theme.dart';

class AppSettings extends ChangeNotifier {
  final AppSettingsStorage storage;

  Color _accentColor;
  AppLanguage _language;
  AppTheme _theme;

  AppSettings({
    required this.storage,
    this._accentColor = AppColors.accent,
    this._language = AppLanguage.spanish,
    this._theme = AppTheme.dark,
  });

  Color get accentColor => _accentColor;

  AppLanguage get language => _language;

  AppTheme get theme => _theme;

  LanguageStrings get strings => LanguageStrings(_language);

  Future<void> load() async {
    final data = await storage.load();

    if (data == null) {
      return;
    }

    _accentColor = data.accentColor;
    _language = data.language;
    _theme = data.theme;
  }

  Future<void> setAccentColor(Color color) async {
    if (_accentColor == color) {
      return;
    }

    _accentColor = color;

    await storage.save(
      accentColor: _accentColor,
      language: _language,
      theme: _theme,
    );

    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language) {
      return;
    }

    _language = language;

    await storage.save(
      accentColor: _accentColor,
      language: _language,
      theme: _theme,
    );

    notifyListeners();
  }

  Future<void> setTheme(AppTheme theme) async {
    if (_theme == theme) {
      return;
    }

    _theme = theme;

    await storage.save(
      accentColor: _accentColor,
      language: _language,
      theme: _theme,
    );

    notifyListeners();
  }
}