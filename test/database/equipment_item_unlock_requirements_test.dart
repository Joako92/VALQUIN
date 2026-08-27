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
    'inserts and reads an equipment item unlock requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_novato',
        name: 'CASCO DEL NOVATO',
        rarity: 'common',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemUnlockRequirement(
        equipmentItemId: 'casco_novato',
        condition: 'strength',
        value: 1,
      );

      final requirement =
          await database.getEquipmentItemUnlockRequirement(
        requirementId,
      );

      expect(requirement, isNotNull);
      expect(
        requirement!.equipmentItemId,
        'casco_novato',
      );
      expect(
        requirement.condition,
        'strength',
      );
      expect(
        requirement.value,
        1,
      );
    },
  );

  test(
    'gets all unlock requirements associated with an equipment item',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_fuerte',
        name: 'CASCO FUERTE',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      await database.insertEquipmentItemUnlockRequirement(
        equipmentItemId: 'casco_fuerte',
        condition: 'level',
        value: 2,
      );

      await database.insertEquipmentItemUnlockRequirement(
        equipmentItemId: 'casco_fuerte',
        condition: 'strength',
        value: 10,
      );

      final requirements =
          await database.getEquipmentItemUnlockRequirements(
        'casco_fuerte',
      );

      expect(requirements.length, 2);

      expect(
        requirements.any(
          (requirement) =>
              requirement.condition == 'level' &&
              requirement.value == 2,
        ),
        isTrue,
      );

      expect(
        requirements.any(
          (requirement) =>
              requirement.condition == 'strength' &&
              requirement.value == 10,
        ),
        isTrue,
      );
    },
  );

  test(
    'updates an equipment item unlock requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_fuerte',
        name: 'CASCO FUERTE',
        rarity: 'rare',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemUnlockRequirement(
        equipmentItemId: 'casco_fuerte',
        condition: 'level',
        value: 2,
      );

      final updated =
          await database.updateEquipmentItemUnlockRequirement(
        id: requirementId,
        condition: 'strength',
        value: 10,
      );

      expect(updated, isTrue);

      final requirement =
          await database.getEquipmentItemUnlockRequirement(
        requirementId,
      );

      expect(requirement, isNotNull);
      expect(
        requirement!.equipmentItemId,
        'casco_fuerte',
      );
      expect(
        requirement.condition,
        'strength',
      );
      expect(
        requirement.value,
        10,
      );
    },
  );

  test(
    'deletes an equipment item unlock requirement',
    () async {
      await database.insertEquipmentItem(
        id: 'casco_novato',
        name: 'CASCO DEL NOVATO',
        rarity: 'common',
        slot: 'head',
        cooldownHours: 24,
      );

      final requirementId =
          await database.insertEquipmentItemUnlockRequirement(
        equipmentItemId: 'casco_novato',
        condition: 'strength',
        value: 1,
      );

      final beforeDelete =
          await database.getEquipmentItemUnlockRequirement(
        requirementId,
      );

      expect(beforeDelete, isNotNull);

      final deleted =
          await database.deleteEquipmentItemUnlockRequirement(
        requirementId,
      );

      expect(deleted, isTrue);

      final afterDelete =
          await database.getEquipmentItemUnlockRequirement(
        requirementId,
      );

      expect(afterDelete, isNull);
    },
  );
}
