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

    if (kDebugMode) {
      print('========================================');
      print('EXERCISES IN DATABASE');
      print('TOTAL: ${exercises.length}');
      print('========================================');

      for (final exercise in exercises) {
        print(
          'ID: ${exercise.id} | NAME: ${exercise.name}',
        );
      }
    }

    if (kDebugMode) {
      print('========================================');
    }
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
    if (kDebugMode) {
      print('========================================');
      print('DATABASE DEBUG');
      print('========================================');
    }
    
    final exercises =
        await database.select(database.exercises).get();

    if (kDebugMode) {
      print('EXERCISES: ${exercises.length}');
    }

    for (final exercise in exercises) {
      if (kDebugMode) {
        print('');
        print('Exercise: ${exercise.id}');
        print('Name: ${exercise.name}');
      }
      

      final links =
          await database.getExerciseVariantLinks(exercise.id);

      if (kDebugMode) {
        print('Variant links: ${links.length}');
      }

      for (final link in links) {
        final variant =
            await database.getExerciseVariant(link.variantId);

        if (kDebugMode) {
          print(
            '  Variant ${link.variantId}: '
            '${variant?.variantIndex} | '
            '${variant?.sets} sets | '
            '${variant?.amount} ${variant?.unit}',
          );
        }
      }

      final equipmentRelations =
          await database.getEquipmentItemExercises(
        exercise.id,
      );

      if (kDebugMode) {
        print(
          'Equipment relations: '
          '${equipmentRelations.length}',
        );
      }

      for (final relation in equipmentRelations) {
        if (kDebugMode) {
            print(
            '  Equipment: ${relation.equipmentItemId} '
            '| maxVariant: ${relation.maxVariant}',
          );
        }
      }
    }

    if (kDebugMode) {
      print('');
      print('========================================');
    }
  }

  static Future<void> debugEquipmentDatabase(
    AppDatabase database,
  ) async {
    if (kDebugMode) {
      print('========================================');
      print('EQUIPMENT DATABASE DEBUG');
      print('========================================');
    }

    final items =
        await database.select(database.equipmentItems).get();

    if (kDebugMode) {
      print('EQUIPMENT ITEMS: ${items.length}');
    }

    for (final item in items) {
      if (kDebugMode) {
        print('');
        print('Equipment: ${item.id}');
        print('Name: ${item.name}');
      }

      final relations =
          await database.getEquipmentItemExercises(item.id);

      if (kDebugMode) {
        print('Exercises: ${relations.length}');
      }

      for (final relation in relations) {
        if (kDebugMode) {
          print(
            '  Exercise ID: ${relation.exerciseId} '
            '| maxVariant: ${relation.maxVariant}',
          );
        }
      }
    }

    if (kDebugMode) {
      print('');
      print('========================================');
    }
  }
}
