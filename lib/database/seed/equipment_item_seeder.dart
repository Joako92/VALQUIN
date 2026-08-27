import '../app_database.dart';

class EquipmentItemSeeder {
  static Future<void> seed(AppDatabase database) async {
    // ==================================================
    // CASCO DEL NOVATO
    // ==================================================

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
      maxVariant: 0,
    );

    await database.insertEquipmentItemStat(
      equipmentItemId: 'casco_novato',
      stat: 'stamina',
      value: 2,
    );

    // ==================================================
    // CASCO MEJORADO
    // ==================================================

    await database.insertEquipmentItem(
      id: 'casco_mejorado',
      name: 'CORONA DE LAURELES DE NIKÉ',
      rarity: 'rare',
      slot: 'head',
      cooldownHours: 24,
    );

    await database.insertEquipmentItemExercise(
      equipmentItemId: 'casco_mejorado',
      exerciseId: 'trote',
      maxVariant: 1,
    );

    await database.insertEquipmentItemStat(
      equipmentItemId: 'casco_mejorado',
      stat: 'stamina',
      value: 3,
    );

    await database.insertEquipmentItemUnlockRequirement(
      equipmentItemId: 'casco_mejorado',
      condition: 'level',
      value: 2,
    );

    await database.insertEquipmentItemEquipRequirement(
      equipmentItemId: 'casco_mejorado',
      condition: 'stamina',
      value: 10,
    );

    // ==================================================
    // PECHERA DEL NOVATO
    // ==================================================

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
      maxVariant: 0,
    );

    await database.insertEquipmentItemExercise(
      equipmentItemId: 'pechera_novato',
      exerciseId: 'apertura_mancuernas',
      maxVariant: 0,
    );

    await database.insertEquipmentItemStat(
      equipmentItemId: 'pechera_novato',
      stat: 'strength',
      value: 2,
    );

    // ==================================================
    // CARAMELORARO
    // ==================================================

    await database.insertEquipmentItem(
      id: 'mejora_nivel',
      name: 'CARAMELORARO',
      rarity: 'legendary',
      slot: 'accessory',
      cooldownHours: 0,
    );

    await database.insertEquipmentItemExercise(
      equipmentItemId: 'mejora_nivel',
      exerciseId: 'carameloraro',
      maxVariant: 0,
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

    // ==================================================
    // INEQUIPABLE
    // ==================================================

    await database.insertEquipmentItem(
      id: 'item_inequipable',
      name: 'INEQUIPABLE',
      rarity: 'legendary',
      slot: 'belt',
      cooldownHours: 0,
    );

    await database.insertEquipmentItemExercise(
      equipmentItemId: 'item_inequipable',
      exerciseId: 'trote',
      maxVariant: 0,
    );

    await database.insertEquipmentItemEquipRequirement(
      equipmentItemId: 'item_inequipable',
      condition: 'stamina',
      value: 100000,
    );
  }
}