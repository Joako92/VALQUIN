import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import '../../lib/database/app_database.dart';

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
    'inserts and reads an equipment item stat',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      final statId =
          await database.insertEquipmentItemStat(
        equipmentItemId: 'pechera_novato',
        stat: 'strength',
        value: 2,
      );

      final stat =
          await database.getEquipmentItemStat(statId);

      expect(stat, isNotNull);
      expect(stat!.equipmentItemId, 'pechera_novato');
      expect(stat.stat, 'strength');
      expect(stat.value, 2);
    },
  );

  test(
    'gets all stats associated with an equipment item',
    () async {
      await database.insertEquipmentItem(
        id: 'mejora_nivel',
        name: 'CARAMELORARO',
        rarity: 'legendary',
        slot: 'accessory',
        cooldownHours: 0,
      );

      await database.insertEquipmentItemStat(
        equipmentItemId: 'mejora_nivel',
        stat: 'strength',
        value: 30,
      );

      await database.insertEquipmentItemStat(
        equipmentItemId: 'mejora_nivel',
        stat: 'endurance',
        value: 30,
      );

      await database.insertEquipmentItemStat(
        equipmentItemId: 'mejora_nivel',
        stat: 'energy',
        value: 30,
      );

      await database.insertEquipmentItemStat(
        equipmentItemId: 'mejora_nivel',
        stat: 'stamina',
        value: 30,
      );

      final stats =
          await database.getEquipmentItemStats(
        'mejora_nivel',
      );

      expect(stats.length, 4);

      expect(stats['strength'], 30);
      expect(stats['endurance'], 30);
      expect(stats['energy'], 30);
      expect(stats['stamina'], 30);
    },
  );

  test(
    'updates an equipment item stat',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      final statId =
          await database.insertEquipmentItemStat(
        equipmentItemId: 'pechera_novato',
        stat: 'strength',
        value: 2,
      );

      final updated =
          await database.updateEquipmentItemStat(
        id: statId,
        stat: 'strength',
        value: 5,
      );

      expect(updated, isTrue);

      final stat =
          await database.getEquipmentItemStat(statId);

      expect(stat, isNotNull);
      expect(stat!.equipmentItemId, 'pechera_novato');
      expect(stat.stat, 'strength');
      expect(stat.value, 5);
    },
  );

  test(
    'deletes an equipment item stat',
    () async {
      await database.insertEquipmentItem(
        id: 'pechera_novato',
        name: 'PECHERA DEL NOVATO',
        rarity: 'common',
        slot: 'chest',
        cooldownHours: 24,
      );

      final statId =
          await database.insertEquipmentItemStat(
        equipmentItemId: 'pechera_novato',
        stat: 'strength',
        value: 2,
      );

      final beforeDelete =
          await database.getEquipmentItemStat(statId);

      expect(beforeDelete, isNotNull);

      final deleted =
          await database.deleteEquipmentItemStat(statId);

      expect(deleted, isTrue);

      final afterDelete =
          await database.getEquipmentItemStat(statId);

      expect(afterDelete, isNull);
    },
  );
}