import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:valquin/database/app_database.dart';

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
    'deletes an exercise completely and preserves reusable variant data',
    () async {
      // --------------------------------------------------
      // VARIANT FAMILIES
      // --------------------------------------------------

      await database.insertVariantFamily(
        id: 'long_distance',
        name: 'Fondo',
        unit: 'km',
      );

      await database.insertExerciseVariant(
        familyId: 'long_distance',
        variantIndex: 0,
        sets: null,
        amount: 1,
      );

      await database.insertExerciseVariant(
        familyId: 'long_distance',
        variantIndex: 1,
        sets: null,
        amount: 2,
      );

      await database.insertVariantFamily(
        id: 'standard_reps',
        name: 'Repeticiones estándar',
        unit: 'reps',
      );

      await database.insertExerciseVariant(
        familyId: 'standard_reps',
        variantIndex: 0,
        sets: 3,
        amount: 10,
      );

      // --------------------------------------------------
      // EXERCISE TO DELETE
      // --------------------------------------------------

      await database.insertExercise(
        id: 'trote',
        name: 'TROTE',
      );

      // --------------------------------------------------
      // UNRELATED EXERCISE
      // --------------------------------------------------

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      // --------------------------------------------------
      // EQUIPMENT USING TROTE
      // --------------------------------------------------

      await database.insertEquipmentItem(
        id: 'casco_novato',
        name: 'CASCO DEL NOVATO',
        rarity: 'common',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'casco_novato',
        exerciseId: 'trote',
        variantFamilyId: 'long_distance',
        maxVariant: 1,
      );

      // --------------------------------------------------
      // EQUIPMENT USING THE UNRELATED EXERCISE
      // --------------------------------------------------

      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        variantFamilyId: 'standard_reps',
        maxVariant: 0,
      );

      // --------------------------------------------------
      // DELETE
      // --------------------------------------------------

      final deleted =
          await database.deleteExerciseCompletely(
        'trote',
      );

      expect(deleted, isTrue);

      // --------------------------------------------------
      // EXERCISE IS GONE
      // --------------------------------------------------

      expect(
        await database.getExercise('trote'),
        isNull,
      );

      // --------------------------------------------------
      // TROTE'S EQUIPMENT RELATION IS GONE
      // --------------------------------------------------

      expect(
        await database.getEquipmentItemExercises(
          'casco_novato',
        ),
        isEmpty,
      );

      // --------------------------------------------------
      // VARIANT FAMILY IS PRESERVED
      // --------------------------------------------------

      final longDistanceFamily =
          await database.getVariantFamilyWithVariants(
        'long_distance',
      );

      expect(
        longDistanceFamily,
        isNotNull,
      );

      expect(
        longDistanceFamily!.id,
        'long_distance',
      );

      expect(
        longDistanceFamily.name,
        'Fondo',
      );

      expect(
        longDistanceFamily.unit,
        'km',
      );

      expect(
        longDistanceFamily.variants.length,
        2,
      );

      expect(
        longDistanceFamily.variants[0].index,
        0,
      );

      expect(
        longDistanceFamily.variants[0].amount,
        1,
      );

      expect(
        longDistanceFamily.variants[1].index,
        1,
      );

      expect(
        longDistanceFamily.variants[1].amount,
        2,
      );

      // --------------------------------------------------
      // UNRELATED EXERCISE IS PRESERVED
      // --------------------------------------------------

      final benchPress =
          await database.getExercise(
        'bench_press',
      );

      expect(
        benchPress,
        isNotNull,
      );

      expect(
        benchPress!.id,
        'bench_press',
      );

      expect(
        benchPress.name,
        'BENCH PRESS',
      );

      // --------------------------------------------------
      // UNRELATED EXERCISE'S EQUIPMENT RELATION IS PRESERVED
      // --------------------------------------------------

      final benchPressRelations =
          await database.getEquipmentItemExercises(
        'pechera_novato',
      );

      expect(
        benchPressRelations.length,
        1,
      );

      expect(
        benchPressRelations.first.exerciseId,
        'bench_press',
      );

      expect(
        benchPressRelations.first.variantFamilyId,
        'standard_reps',
      );

      expect(
        benchPressRelations.first.maxVariant,
        0,
      );

      // --------------------------------------------------
      // EQUIPMENT ITEMS THEMSELVES ARE PRESERVED
      // --------------------------------------------------

      expect(
        await database.getEquipmentItem(
          'casco_novato',
        ),
        isNotNull,
      );

      expect(
        await database.getEquipmentItem(
          'pechera_novato',
        ),
        isNotNull,
      );
    },
  );

  test(
    'returns false when deleting a non-existent exercise',
    () async {
      final deleted =
          await database.deleteExerciseCompletely(
        'does_not_exist',
      );

      expect(deleted, isFalse);
    },
  );
}
