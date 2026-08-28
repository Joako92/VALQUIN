import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:solo_training_001/database/app_database.dart';

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
    'deletes an exercise completely and preserves unrelated data',
    () async {
      // --------------------------------------------------
      // EXERCISE TO DELETE
      // --------------------------------------------------

      await database.insertExercise(
        id: 'trote',
        name: 'TROTE',
      );

      final troteVariant0 =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: null,
        amount: 1,
        unit: 'km',
      );

      final troteVariant1 =
          await database.insertExerciseVariant(
        variantIndex: 1,
        sets: null,
        amount: 2,
        unit: 'km',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'trote',
        variantId: troteVariant0,
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'trote',
        variantId: troteVariant1,
      );

      // --------------------------------------------------
      // UNRELATED EXERCISE
      // --------------------------------------------------

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      final benchVariant =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'bench_press',
        variantId: benchVariant,
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
        maxVariant: 1,
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
      // VARIANTS ARE GONE
      // --------------------------------------------------

      expect(
        await database.getExerciseVariant(troteVariant0),
        isNull,
      );

      expect(
        await database.getExerciseVariant(troteVariant1),
        isNull,
      );

      // --------------------------------------------------
      // EXERCISE -> VARIANT LINKS ARE GONE
      // --------------------------------------------------

      expect(
        await database.getExerciseVariantLinks('trote'),
        isEmpty,
      );

      // --------------------------------------------------
      // EQUIPMENT -> EXERCISE RELATION IS GONE
      // --------------------------------------------------

      expect(
        await database.getEquipmentItemExercises(
          'casco_novato',
        ),
        isEmpty,
      );

      // --------------------------------------------------
      // UNRELATED EXERCISE IS PRESERVED
      // --------------------------------------------------

      final benchPress =
          await database.getExerciseWithVariants(
        'bench_press',
      );

      expect(benchPress, isNotNull);
      expect(benchPress!.id, 'bench_press');
      expect(benchPress.variants.length, 1);
      expect(benchPress.variants.first.index, 0);
      expect(benchPress.variants.first.sets, 3);
      expect(benchPress.variants.first.amount, 10);
      expect(benchPress.variants.first.unit, 'reps');

      // Its variant must also remain.
      expect(
        await database.getExerciseVariant(benchVariant),
        isNotNull,
      );

      // --------------------------------------------------
      // EQUIPMENT ITEM ITSELF IS PRESERVED
      // --------------------------------------------------

      expect(
        await database.getEquipmentItem('casco_novato'),
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
