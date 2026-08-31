import '../../data/equipment_items.dart';
import '../app_database.dart';

class EquipmentItemSeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final item in equipmentItems) {
      await database.replaceEquipmentItem(
        id: item.id,
        name: item.name,
        rarity: item.rarity.name,
        slot: item.slot.name,
        cooldownHours: item.cooldownHours,
        exercises: item.exercises,
        stats: item.stats,
        unlockRequirements: item.unlockRequirements,
        equipRequirements: item.equipRequirements,
      );
    }
  }
}
