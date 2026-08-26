import '../app_database.dart';
import '../../data/equipment_items.dart';

class EquipmentItemSeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final equipmentItem in equipmentItems) {
      await database.insertEquipmentItem(
        id: equipmentItem.id,
        name: equipmentItem.name,
        rarity: equipmentItem.rarity.name,
        slot: equipmentItem.slot.name,
        cooldownHours: equipmentItem.cooldownHours,
      );

      for (final equipmentExercise
          in equipmentItem.exercises) {
        await database.insertEquipmentItemExercise(
          equipmentItemId: equipmentItem.id,
          exerciseId: equipmentExercise.exercise.id,
          maxVariant: equipmentExercise.maxVariant,
        );
      }
    }
  }
}