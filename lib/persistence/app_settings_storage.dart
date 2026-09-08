import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../localization/language.dart';

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
    );
  }

  Future<void> save({
    required Color accentColor,
    required AppLanguage language,
  }) async {
    await database
        .into(database.appSettings)
        .insertOnConflictUpdate(
      AppSettingsCompanion(
        id: const Value(1),
        accentColor: Value(accentColor.toARGB32()),
        language: Value(language.name),
      ),
    );
  }
}

class AppSettingsData {
  final Color accentColor;
  final AppLanguage language;

  const AppSettingsData({
    required this.accentColor,
    required this.language,
  });
}
