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
    'inserts and reads an equipment item equip requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_mejorado',
        name: 'CORONA DE LAURELES DE NIKÉ',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemEquipRequirement(
        equipmentItemId: 'casco_mejorado',
        condition: 'stamina',
        value: 10,
      );

      final requirement =
          await database.getEquipmentItemEquipRequirement(
        requirementId,
      );

      expect(requirement, isNotNull);
      expect(
        requirement!.equipmentItemId,
        'casco_mejorado',
      );
      expect(
        requirement.condition,
        'stamina',
      );
      expect(
        requirement.value,
        10,
      );
    },
  );

  test(
    'gets all equip requirements associated with an equipment item',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_fuerte',
        name: 'PECHERA FUERTE',
        rarity: 'rare',
        slot: 'chest',
        cooldownHours: 24,
      );

      await database.insertEquipmentItemEquipRequirement(
        equipmentItemId: 'pechera_fuerte',
        condition: 'level',
        value: 5,
      );

      await database.insertEquipmentItemEquipRequirement(
        equipmentItemId: 'pechera_fuerte',
        condition: 'strength',
        value: 20,
      );

      final requirements =
          await database.getEquipmentItemEquipRequirements(
        'pechera_fuerte',
      );

      expect(requirements.length, 2);

      expect(
        requirements.any(
          (requirement) =>
              requirement.condition == 'level' &&
              requirement.value == 5,
        ),
        isTrue,
      );

      expect(
        requirements.any(
          (requirement) =>
              requirement.condition == 'strength' &&
              requirement.value == 20,
        ),
        isTrue,
      );
    },
  );

  test(
    'updates an equipment item equip requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_mejorado',
        name: 'CORONA DE LAURELES DE NIKÉ',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemEquipRequirement(
        equipmentItemId: 'casco_mejorado',
        condition: 'stamina',
        value: 10,
      );

      final updated =
          await database.updateEquipmentItemEquipRequirement(
        id: requirementId,
        condition: 'stamina',
        value: 20,
      );

      expect(updated, isTrue);

      final requirement =
          await database.getEquipmentItemEquipRequirement(
        requirementId,
      );

      expect(requirement, isNotNull);
      expect(
        requirement!.equipmentItemId,
        'casco_mejorado',
      );
      expect(
        requirement.condition,
        'stamina',
      );
      expect(
        requirement.value,
        20,
      );
    },
  );

  test(
    'deletes an equipment item equip requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_mejorado',
        name: 'CORONA DE LAURELES DE NIKÉ',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemEquipRequirement(
        equipmentItemId: 'casco_mejorado',
        condition: 'stamina',
        value: 10,
      );

      final beforeDelete =
          await database.getEquipmentItemEquipRequirement(
        requirementId,
      );

      expect(beforeDelete, isNotNull);

      final deleted =
          await database.deleteEquipmentItemEquipRequirement(
        requirementId,
      );

      expect(deleted, isTrue);

      final afterDelete =
          await database.getEquipmentItemEquipRequirement(
        requirementId,
      );

      expect(afterDelete, isNull);
    },
  );
}
