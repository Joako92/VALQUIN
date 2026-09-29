import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../localization/language.dart';

import '../config/app_theme.dart';

class AppSettingsStorage {
  final AppDatabase database;

  AppSettingsStorage({
    required this.database,
  });

  Future<AppSettingsData?> load() async {
    final row = await database
        .select(database.appSettings)
        .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return AppSettingsData(
      accentColor: Color(row.accentColor),
      language: AppLanguage.values.byName(row.language),
      theme: AppTheme.values.byName(row.theme),
    );
  }

  Future<void> save({
    required Color accentColor,
    required AppLanguage language,
    required AppTheme theme,
  }) async {
    await database
        .into(database.appSettings)
        .insertOnConflictUpdate(
      AppSettingsCompanion(
        id: const Value(1),
        accentColor: Value(accentColor.toARGB32()),
        language: Value(language.name),
        theme: Value(theme.name),
      ),
    );
  }
}

class AppSettingsData {
  final Color accentColor;
  final AppLanguage language;
  final AppTheme theme;

  const AppSettingsData({
    required this.accentColor,
    required this.language,
    required this.theme,
  });
}
