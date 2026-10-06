import 'package:flutter/foundation.dart';

import '../app_database.dart';

class DatabaseAdmin {
  // --------------------------------------------------
  // PRINT ALL EXERCISES
  // --------------------------------------------------

  static Future<void> printExercises(
    AppDatabase database,
  ) async {
    final exercises =
        await database.select(database.exercises).get();

    if (!kDebugMode) {
      return;
    }
    
    debugPrint('========================================');
    debugPrint('EXERCISES IN DATABASE');
    debugPrint('TOTAL: ${exercises.length}');
    debugPrint('========================================');

    for (final exercise in exercises) {
      debugPrint(
        'ID: ${exercise.id} | NAME: ${exercise.name}',
      );
    }

    debugPrint('========================================');
  }

  // --------------------------------------------------
  // DELETE EXERCISE COMPLETELY
  // --------------------------------------------------

  static Future<bool> deleteExercise(
    AppDatabase database,
    String exerciseId,
  ) {
    return database.deleteExerciseCompletely(
      exerciseId,
    );
  }

  // --------------------------------------------------
  // DELETE EQUIPMENT ITEM COMPLETELY
  // --------------------------------------------------

  static Future<bool> deleteEquipmentItem(
    AppDatabase database,
    String equipmentItemId,
  ) {
    return database.deleteEquipmentItemCompletely(
      equipmentItemId,
    );
  }

  // --------------------------------------------------
  // DEBUG EXERCISE DATABASE
  // --------------------------------------------------

  static Future<void> debugExerciseDatabase(
    AppDatabase database,
  ) async {
    if (!kDebugMode) {
      return;
    }

    debugPrint('========================================');
    debugPrint('DATABASE DEBUG');
    debugPrint('========================================');

    final exercises =
        await database.select(database.exercises).get();

    debugPrint('EXERCISES: ${exercises.length}');

    for (final exercise in exercises) {
      debugPrint('');
      debugPrint('Exercise: ${exercise.id}');
      debugPrint('Name: ${exercise.name}');

      final equipmentRelations =
          await database.getEquipmentItemExercises(
        exercise.id,
      );

      debugPrint(
        'Equipment relations: '
        '${equipmentRelations.length}',
      );

      for (final relation in equipmentRelations) {
        debugPrint(
          '  Equipment: ${relation.equipmentItemId} '
          '| family: ${relation.variantFamilyId} '
          '| maxVariant: ${relation.maxVariant}',
        );
      }
    }

    debugPrint('');
    debugPrint('========================================');
  }

  // --------------------------------------------------
  // DEBUG EQUIPMENT DATABASE
  // --------------------------------------------------

  static Future<void> debugEquipmentDatabase(
    AppDatabase database,
  ) async {
    if (!kDebugMode) {
      return;
    }

    debugPrint('========================================');
    debugPrint('EQUIPMENT DATABASE DEBUG');
    debugPrint('========================================');

    final items =
        await database.select(database.equipmentItems).get();

    debugPrint('EQUIPMENT ITEMS: ${items.length}');

    for (final item in items) {
      debugPrint('');
      debugPrint('Equipment: ${item.id}');
      debugPrint('Name: ${item.name}');

      final relations =
          await database.getEquipmentItemExercises(item.id);

      debugPrint('Exercises: ${relations.length}');

      for (final relation in relations) {
        debugPrint(
          '  Exercise ID: ${relation.exerciseId} '
          '| family: ${relation.variantFamilyId} '
          '| maxVariant: ${relation.maxVariant}',
        );
      }
    }

    debugPrint('');
    debugPrint('========================================');
  }
}
