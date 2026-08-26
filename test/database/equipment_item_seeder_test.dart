import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import '../../lib/database/app_database.dart';
import '../../lib/database/seed/exercise_seeder.dart';
import '../../lib/database/seed/equipment_item_seeder.dart';
import '../../lib/data/equipment_items.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;

  setUp(() {
    database = AppDatabase(
      NativeDatabase.memory(),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test(
    'seeds all equipment items into the database',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      for (final equipmentItem in equipmentItems) {
        final storedEquipmentItem =
            await database.getEquipmentItem(
          equipmentItem.id,
        );

        expect(
          storedEquipmentItem,
          isNotNull,
        );

        expect(
          storedEquipmentItem!.id,
          equipmentItem.id,
        );

        expect(
          storedEquipmentItem.name,
          equipmentItem.name,
        );

        expect(
          storedEquipmentItem.rarity,
          equipmentItem.rarity.name,
        );

        expect(
          storedEquipmentItem.slot,
          equipmentItem.slot.name,
        );

        expect(
          storedEquipmentItem.cooldownHours,
          equipmentItem.cooldownHours,
        );
      }
    },
  );

  test(
    'seeds all equipment item exercise relations',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      for (final equipmentItem in equipmentItems) {
        final storedRelations =
            await database.getEquipmentItemExercises(
          equipmentItem.id,
        );

        expect(
          storedRelations.length,
          equipmentItem.exercises.length,
        );

        for (final expectedExercise
            in equipmentItem.exercises) {
          final matchingRelations =
              storedRelations.where(
            (relation) =>
                relation.exerciseId ==
                    expectedExercise.exercise.id &&
                relation.maxVariant ==
                    expectedExercise.maxVariant,
          );

          expect(
            matchingRelations.length,
            1,
          );
        }
      }
    },
  );

  test(
    'reconstructs equipment items equal to source data',
    () async {
      // Seed exercises first because equipment items
      // reference existing exercises.
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final storedEquipmentItems =
          await database.getEquipmentItemsWithExercises();

      expect(
        storedEquipmentItems.length,
        equipmentItems.length,
      );

      for (final expectedItem in equipmentItems) {
        final actualItem =
            storedEquipmentItems.firstWhere(
          (item) => item.id == expectedItem.id,
        );

        expect(actualItem.name, expectedItem.name);

        expect(
          actualItem.rarity,
          expectedItem.rarity,
        );

        expect(
          actualItem.slot,
          expectedItem.slot,
        );

        expect(
          actualItem.cooldownHours,
          expectedItem.cooldownHours,
        );

        expect(
          actualItem.exercises.length,
          expectedItem.exercises.length,
        );

        for (final expectedExercise
            in expectedItem.exercises) {
          final actualExercise =
              actualItem.exercises.firstWhere(
            (equipmentExercise) =>
                equipmentExercise.exercise.id ==
                expectedExercise.exercise.id,
          );

          expect(
            actualExercise.maxVariant,
            expectedExercise.maxVariant,
          );
        }
      }
    },
  );
}