import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:solo_training_001/database/app_database.dart';
import 'package:solo_training_001/models/rarity.dart';
import 'package:solo_training_001/models/equipment_slot.dart';

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
    'inserts an equipment item exercise relation',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      final relationId =
          await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        maxVariant: 0,
      );

      expect(relationId, greaterThan(0));
    },
  );

  test(
    'stores maxVariant correctly',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_mejorado',
        name: 'CORONA DE LAURELES DE NIKÉ',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'trote',
        name: 'TROTE',
      );

      final relationId =
          await database.insertEquipmentItemExercise(
        equipmentItemId: 'casco_mejorado',
        exerciseId: 'trote',
        maxVariant: 1,
      );

      final relation =
          await database.getEquipmentItemExercise(
        relationId,
      );

      expect(relation, isNotNull);
      expect(relation!.equipmentItemId, 'casco_mejorado');
      expect(relation.exerciseId, 'trote');
      expect(relation.maxVariant, 1);
    },
  );

  test(
    'prevents duplicate equipment item exercise relations',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        maxVariant: 0,
      );

      expect(
        () => database.insertEquipmentItemExercise(
          equipmentItemId: 'pechera_novato',
          exerciseId: 'bench_press',
          maxVariant: 1,
        ),
        throwsA(isA<Exception>()),
      );
    },
  );

  test(
    'gets all exercises associated with an equipment item',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      await database.insertExercise(
        id: 'bench_press',
        name: 'Bench Press',
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'push_up',
        maxVariant: 0,
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        maxVariant: 1,
      );

      final relations =
          await database.getEquipmentItemExercises(
        'pechera_novato',
      );

      expect(relations.length, 2);

      expect(
        relations.any(
          (relation) =>
              relation.exerciseId == 'push_up' &&
              relation.maxVariant == 0,
        ),
        isTrue,
      );

      expect(
        relations.any(
          (relation) =>
              relation.exerciseId == 'bench_press' &&
              relation.maxVariant == 1,
        ),
        isTrue,
      );
    },
  );

  test(
    'updates maxVariant of an equipment item exercise relation',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_mejorado',
        name: 'CORONA DE LAURELES DE NIKÉ',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'trote',
        name: 'TROTE',
      );

      final relationId =
          await database.insertEquipmentItemExercise(
        equipmentItemId: 'casco_mejorado',
        exerciseId: 'trote',
        maxVariant: 0,
      );

      final updated =
          await database.updateEquipmentItemExercise(
        id: relationId,
        maxVariant: 1,
      );

      expect(updated, isTrue);

      final relation =
          await database.getEquipmentItemExercise(
        relationId,
      );

      expect(relation, isNotNull);
      expect(
        relation!.equipmentItemId,
        'casco_mejorado',
      );
      expect(
        relation.exerciseId,
        'trote',
      );
      expect(
        relation.maxVariant,
        1,
      );
    },
  );

  test(
    'deletes an equipment item exercise relation',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_novato',
        name: 'CASCO DEL NOVATO',
        rarity: 'common',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'trote',
        name: 'TROTE',
      );

      final relationId =
          await database.insertEquipmentItemExercise(
        equipmentItemId: 'casco_novato',
        exerciseId: 'trote',
        maxVariant: 0,
      );

      final beforeDelete =
          await database.getEquipmentItemExercise(
        relationId,
      );

      expect(beforeDelete, isNotNull);

      final deleted =
          await database.deleteEquipmentItemExercise(
        relationId,
      );

      expect(deleted, isTrue);

      final afterDelete =
          await database.getEquipmentItemExercise(
        relationId,
      );

      expect(afterDelete, isNull);
    },
  );

  test(
    'reconstructs equipment item with its exercises',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'push_up',
        name: 'PUSH UP',
      );

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'push_up',
        maxVariant: 0,
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        maxVariant: 1,
      );

      final equipmentItem =
          await database.getEquipmentItemWithExercises(
        'pechera_novato',
      );

      expect(equipmentItem, isNotNull);

      expect(
        equipmentItem!.id,
        'pechera_novato',
      );

      expect(
        equipmentItem.name,
        'PECHERA DEL NOVATO',
      );

      expect(
        equipmentItem.rarity,
        Rarity.common,
      );

      expect(
        equipmentItem.slot,
        EquipmentSlot.chest,
      );

      expect(
        equipmentItem.cooldownHours,
        24,
      );

      expect(
        equipmentItem.exercises.length,
        2,
      );

      final pushUp =
          equipmentItem.exercises.firstWhere(
        (equipmentExercise) =>
            equipmentExercise.exercise.id == 'push_up',
      );

      expect(pushUp.maxVariant, 0);

      final benchPress =
          equipmentItem.exercises.firstWhere(
        (equipmentExercise) =>
            equipmentExercise.exercise.id == 'bench_press',
      );

      expect(benchPress.maxVariant, 1);

      expect(
        equipmentItem.stats,
        isEmpty,
      );

      expect(
        equipmentItem.unlockRequirements.level,
        isNull,
      );

      expect(
        equipmentItem.unlockRequirements.stats,
        isEmpty,
      );

      expect(
        equipmentItem.equipRequirements.level,
        isNull,
      );

      expect(
        equipmentItem.equipRequirements.stats,
        isEmpty,
      );
    },
  );

  test(
    'reconstructs all equipment items with their exercises',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_novato',
        name: 'CASCO DEL NOVATO',
        rarity: 'common',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertExercise(
        id: 'push_up',
        name: 'PUSH UP',
      );

      await database.insertExercise(
        id: 'bench_press',
        name: 'BENCH PRESS',
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'casco_novato',
        exerciseId: 'push_up',
        maxVariant: 0,
      );

      await database.insertEquipmentItemExercise(
        equipmentItemId: 'pechera_novato',
        exerciseId: 'bench_press',
        maxVariant: 1,
      );

      final equipmentItems =
          await database.getEquipmentItemsWithExercises();

      expect(equipmentItems.length, 2);

      final helmet =
          equipmentItems.firstWhere(
        (item) => item.id == 'casco_novato',
      );

      expect(helmet.name, 'CASCO DEL NOVATO');
      expect(helmet.rarity, Rarity.common);
      expect(helmet.slot, EquipmentSlot.head);
      expect(helmet.cooldownHours, 24);
      expect(helmet.exercises.length, 1);
      expect(
        helmet.exercises.first.exercise.id,
        'push_up',
      );
      expect(
        helmet.exercises.first.maxVariant,
        0,
      );

      final chest =
          equipmentItems.firstWhere(
        (item) => item.id == 'pechera_novato',
      );

      expect(chest.name, 'PECHERA DEL NOVATO');
      expect(chest.rarity, Rarity.common);
      expect(chest.slot, EquipmentSlot.chest);
      expect(chest.cooldownHours, 24);
      expect(chest.exercises.length, 1);
      expect(
        chest.exercises.first.exercise.id,
        'bench_press',
      );
      expect(
        chest.exercises.first.maxVariant,
        1,
      );
    },
  );
}