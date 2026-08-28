// database/seed/equipment_item_seeder.dart

import '../../data/equipment_items.dart';
import '../app_database.dart';

class EquipmentItemSeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final item in equipmentItems) {
      // --------------------------------------------------
      // EQUIPMENT ITEM
      // --------------------------------------------------

      await database.insertEquipmentItem(
        id: item.id,
        name: item.name,
        rarity: item.rarity.name,
        slot: item.slot.name,
        cooldownHours: item.cooldownHours,
      );

      // --------------------------------------------------
      // EXERCISES
      // --------------------------------------------------

      for (final equipmentExercise in item.exercises) {
        await database.insertEquipmentItemExercise(
          equipmentItemId: item.id,
          exerciseId: equipmentExercise.exerciseId,
          maxVariant: equipmentExercise.maxVariant,
        );
      }

      // --------------------------------------------------
      // STATS
      // --------------------------------------------------

      for (final entry in item.stats.entries) {
        await database.insertEquipmentItemStat(
          equipmentItemId: item.id,
          stat: entry.key,
          value: entry.value,
        );
      }

      // --------------------------------------------------
      // UNLOCK REQUIREMENTS
      // --------------------------------------------------

      final unlockRequirements =
          item.unlockRequirements;

      if (unlockRequirements.level != null) {
        await database.insertEquipmentItemUnlockRequirement(
          equipmentItemId: item.id,
          condition: 'level',
          value: unlockRequirements.level!,
        );
      }

      for (final entry
          in unlockRequirements.stats.entries) {
        await database.insertEquipmentItemUnlockRequirement(
          equipmentItemId: item.id,
          condition: entry.key,
          value: entry.value,
        );
      }

      // --------------------------------------------------
      // EQUIP REQUIREMENTS
      // --------------------------------------------------

      final equipRequirements =
          item.equipRequirements;

      if (equipRequirements.level != null) {
        await database.insertEquipmentItemEquipRequirement(
          equipmentItemId: item.id,
          condition: 'level',
          value: equipRequirements.level!,
        );
      }

      for (final entry
          in equipRequirements.stats.entries) {
        await database.insertEquipmentItemEquipRequirement(
          equipmentItemId: item.id,
          condition: entry.key,
          value: entry.value,
        );
      }
    }
  }
}