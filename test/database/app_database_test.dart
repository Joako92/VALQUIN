import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:valquin/database/app_database.dart';

import 'package:valquin/models/exercise_variant.dart';
import 'package:valquin/models/variant_family.dart';

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
    'inserts and reads a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'Test',
        value: 100,
      );

      final entry = await database.getTestEntry(id);

      expect(entry, isNotNull);
      expect(entry!.name, 'Test');
      expect(entry.value, 100);
    },
  );

  test(
    'updates a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'Original',
        value: 100,
      );

      final updated = await database.updateTestEntry(
        id: id,
        name: 'Updated',
        value: 200,
      );

      expect(updated, isTrue);

      final entry = await database.getTestEntry(id);

      expect(entry, isNotNull);
      expect(entry!.name, 'Updated');
      expect(entry.value, 200);
    },
  );

  test(
    'deletes a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'To delete',
        value: 100,
      );

      final deleted = await database.deleteTestEntry(id);

      expect(deleted, isTrue);

      final entry = await database.getTestEntry(id);

      expect(entry, isNull);
    },
  );

  // Exercise CRUD

  group('Exercise CRUD', () {
    test(
      'inserts and reads an exercise',
      () async {
        await database.insertExercise(
          id: 'push_up',
          name: 'Push Up',
        );

        final exercise =
            await database.getExercise('push_up');

        expect(exercise, isNotNull);
        expect(exercise!.id, 'push_up');
        expect(exercise.name, 'Push Up');
      },
    );

    test(
      'updates an exercise',
      () async {
        await database.insertExercise(
          id: 'push_up',
          name: 'Push Up',
        );

        final updated =
            await database.updateExercise(
          id: 'push_up',
          name: 'Push Up Advanced',
        );

        expect(updated, isTrue);

        final exercise =
            await database.getExercise('push_up');

        expect(exercise, isNotNull);
        expect(exercise!.name, 'Push Up Advanced');
      },
    );

    test(
      'deletes an exercise',
      () async {
        await database.insertExercise(
          id: 'push_up',
          name: 'Push Up',
        );

        final deleted =
            await database.deleteExercise('push_up');

        expect(deleted, isTrue);

        final exercise =
            await database.getExercise('push_up');

        expect(exercise, isNull);
      },
    );
  });

  // VariantFamily CRUD

  group('VariantFamily CRUD', () {
    test(
      'inserts and reads a variant family',
      () async {
        await database.insertVariantFamily(
          id: 'standard_reps',
          name: 'Repeticiones estándar',
          unit: 'reps',
        );

        final family =
            await database.getVariantFamily(
          'standard_reps',
        );

        expect(family, isNotNull);
        expect(family!.id, 'standard_reps');
        expect(
          family.name,
          'Repeticiones estándar',
        );
        expect(family.unit, 'reps');
      },
    );

    test(
      'updates a variant family',
      () async {
        await database.insertVariantFamily(
          id: 'standard_reps',
          name: 'Repeticiones estándar',
          unit: 'reps',
        );

        final updated =
            await database.updateVariantFamily(
          id: 'standard_reps',
          name: 'Repeticiones de fuerza',
          unit: 'reps',
        );

        expect(updated, isTrue);

        final family =
            await database.getVariantFamily(
          'standard_reps',
        );

        expect(family, isNotNull);
        expect(
          family!.name,
          'Repeticiones de fuerza',
        );
        expect(family.unit, 'reps');
      },
    );

    test(
      'deletes a variant family',
      () async {
        await database.insertVariantFamily(
          id: 'standard_reps',
          name: 'Repeticiones estándar',
          unit: 'reps',
        );

        final deleted =
            await database.deleteVariantFamily(
          'standard_reps',
        );

        expect(deleted, isTrue);

        final family =
            await database.getVariantFamily(
          'standard_reps',
        );

        expect(family, isNull);
      },
    );
  });

  // ExerciseVariant CRUD

  group('ExerciseVariant CRUD', () {
    setUp(() async {
      await database.insertVariantFamily(
        id: 'standard_reps',
        name: 'Repeticiones estándar',
        unit: 'reps',
      );
    });

    test(
      'inserts and reads an exercise variant',
      () async {
        final id =
            await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 0,
          sets: 3,
          amount: 10,
        );

        final variant =
            await database.getExerciseVariant(id);

        expect(variant, isNotNull);
        expect(
          variant!.familyId,
          'standard_reps',
        );
        expect(variant.variantIndex, 0);
        expect(variant.sets, 3);
        expect(variant.amount, 10);
      },
    );

    test(
      'updates an exercise variant',
      () async {
        final id =
            await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 0,
          sets: 3,
          amount: 10,
        );

        final updated =
            await database.updateExerciseVariant(
          id: id,
          familyId: 'standard_reps',
          variantIndex: 1,
          sets: 4,
          amount: 12,
        );

        expect(updated, isTrue);

        final variant =
            await database.getExerciseVariant(id);

        expect(variant, isNotNull);
        expect(
          variant!.familyId,
          'standard_reps',
        );
        expect(variant.variantIndex, 1);
        expect(variant.sets, 4);
        expect(variant.amount, 12);
      },
    );

    test(
      'deletes an exercise variant',
      () async {
        final id =
            await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 0,
          sets: 3,
          amount: 10,
        );

        final deleted =
            await database.deleteExerciseVariant(id);

        expect(deleted, isTrue);

        final variant =
            await database.getExerciseVariant(id);

        expect(variant, isNull);
      },
    );

    test(
      'reads all variants for a family',
      () async {
        await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 0,
          sets: 3,
          amount: 10,
        );

        await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 1,
          sets: 4,
          amount: 12,
        );

        final variants =
            await database.getVariantFamilyVariants(
          'standard_reps',
        );

        expect(variants.length, 2);

        expect(variants[0].familyId, 'standard_reps');
        expect(variants[0].variantIndex, 0);
        expect(variants[0].sets, 3);
        expect(variants[0].amount, 10);

        expect(variants[1].familyId, 'standard_reps');
        expect(variants[1].variantIndex, 1);
        expect(variants[1].sets, 4);
        expect(variants[1].amount, 12);
      },
    );
  });

  // VariantFamily with variants

  group('VariantFamily with variants', () {
    test(
      'reads a variant family with its variants',
      () async {
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

        await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 1,
          sets: 4,
          amount: 12,
        );

        final family =
            await database.getVariantFamilyWithVariants(
          'standard_reps',
        );

        expect(family, isNotNull);

        expect(
          family!.id,
          'standard_reps',
        );
        expect(
          family.name,
          'Repeticiones estándar',
        );
        expect(
          family.unit,
          'reps',
        );

        expect(
          family.variants.length,
          2,
        );

        expect(
          family.variants[0].index,
          0,
        );
        expect(
          family.variants[0].sets,
          3,
        );
        expect(
          family.variants[0].amount,
          10,
        );

        expect(
          family.variants[1].index,
          1,
        );
        expect(
          family.variants[1].sets,
          4,
        );
        expect(
          family.variants[1].amount,
          12,
        );
      },
    );

    test(
      'replaces a variant family and its variants',
      () async {
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

        await database.replaceVariantFamily(
          family: const VariantFamily(
            id: 'standard_reps',
            name: 'Repeticiones de fuerza',
            unit: 'reps',
            variants: [
              ExerciseVariant(
                index: 0,
                sets: 2,
                amount: 5,
              ),
              ExerciseVariant(
                index: 1,
                sets: 3,
                amount: 8,
              ),
            ],
          ),
        );

        final family =
            await database.getVariantFamilyWithVariants(
          'standard_reps',
        );

        expect(family, isNotNull);
        expect(
          family!.name,
          'Repeticiones de fuerza',
        );
        expect(
          family.unit,
          'reps',
        );

        expect(
          family.variants.length,
          2,
        );

        expect(
          family.variants[0].index,
          0,
        );
        expect(
          family.variants[0].sets,
          2,
        );
        expect(
          family.variants[0].amount,
          5,
        );

        expect(
          family.variants[1].index,
          1,
        );
        expect(
          family.variants[1].sets,
          3,
        );
        expect(
          family.variants[1].amount,
          8,
        );
      },
    );

    test(
      'reads all variant families with variants',
      () async {
        await database.insertVariantFamily(
          id: 'standard_reps',
          name: 'Repeticiones estándar',
          unit: 'reps',
        );

        await database.insertVariantFamily(
          id: 'beginner_time',
          name: 'Tiempo principiante',
          unit: 'min',
        );

        await database.insertExerciseVariant(
          familyId: 'standard_reps',
          variantIndex: 0,
          sets: 3,
          amount: 10,
        );

        await database.insertExerciseVariant(
          familyId: 'beginner_time',
          variantIndex: 0,
          sets: null,
          amount: 10,
        );

        final families =
            await database.getVariantFamiliesWithVariants();

        expect(families.length, 2);

        final repsFamily =
            families.firstWhere(
          (family) => family.id == 'standard_reps',
        );

        final timeFamily =
            families.firstWhere(
          (family) => family.id == 'beginner_time',
        );

        expect(
          repsFamily.unit,
          'reps',
        );

        expect(
          repsFamily.variants.length,
          1,
        );

        expect(
          repsFamily.variants.first.amount,
          10,
        );

        expect(
          timeFamily.unit,
          'min',
        );

        expect(
          timeFamily.variants.length,
          1,
        );

        expect(
          timeFamily.variants.first.amount,
          10,
        );
      },
    );
  });

  // EquipmentItem CRUD

  group('EquipmentItem CRUD', () {
    test(
      'inserts an equipment item',
      () async {
        final id = await database.insertEquipmentItem(
          id: 'casco_novato',
          name: 'CASCO DEL NOVATO',
          rarity: 'common',
          slot: 'head',
          cooldownHours: 24,
        );

        expect(id, 1);

        final equipmentItem =
            await database.getEquipmentItem(
          'casco_novato',
        );

        expect(equipmentItem, isNotNull);
        expect(
          equipmentItem!.id,
          'casco_novato',
        );
        expect(
          equipmentItem.name,
          'CASCO DEL NOVATO',
        );
        expect(
          equipmentItem.rarity,
          'common',
        );
        expect(
          equipmentItem.slot,
          'head',
        );
        expect(
          equipmentItem.cooldownHours,
          24,
        );
      },
    );

    test(
      'updates an equipment item',
      () async {
        await database.insertEquipmentItem(
          id: 'casco_novato',
          name: 'CASCO DEL NOVATO',
          rarity: 'common',
          slot: 'head',
          cooldownHours: 24,
        );

        final updated =
            await database.updateEquipmentItem(
          id: 'casco_novato',
          name: 'CORONA DE LAURELES DE NIKÉ',
          rarity: 'rare',
          slot: 'head',
          cooldownHours: 48,
        );

        expect(updated, isTrue);

        final equipmentItem =
            await database.getEquipmentItem(
          'casco_novato',
        );

        expect(equipmentItem, isNotNull);
        expect(
          equipmentItem!.id,
          'casco_novato',
        );
        expect(
          equipmentItem.name,
          'CORONA DE LAURELES DE NIKÉ',
        );
        expect(
          equipmentItem.rarity,
          'rare',
        );
        expect(
          equipmentItem.slot,
          'head',
        );
        expect(
          equipmentItem.cooldownHours,
          48,
        );
      },
    );

    test(
      'deletes an equipment item',
      () async {
        await database.insertEquipmentItem(
          id: 'casco_novato',
          name: 'CASCO DEL NOVATO',
          rarity: 'common',
          slot: 'head',
          cooldownHours: 24,
        );

        final beforeDelete =
            await database.getEquipmentItem(
          'casco_novato',
        );

        expect(beforeDelete, isNotNull);

        final deleted =
            await database.deleteEquipmentItem(
          'casco_novato',
        );

        expect(deleted, isTrue);

        final afterDelete =
            await database.getEquipmentItem(
          'casco_novato',
        );

        expect(afterDelete, isNull);
      },
    );
  });
}
