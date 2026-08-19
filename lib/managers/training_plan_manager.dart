import '../data/equipment_items.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/training_plan.dart';
import '../persistence/training_plan_storage.dart';

class TrainingPlanManager {
  final TrainingPlanStorage storage;

  final TrainingPlan trainingPlan;

  TrainingPlanManager({
    required this.storage,
    required this.trainingPlan,
  });

  // --------------------------------------------------
  // LOAD
  // --------------------------------------------------

  Future<void> loadTrainingPlan() async {
    final data = await storage.loadTrainingPlan();

    // --------------------------------------------------
    // EQUIPMENT
    // --------------------------------------------------

    final equipmentIds =
        data['equipmentIds'] as List<String>;

    for (final id in equipmentIds) {
      final item = _findEquipmentItem(id);

      if (item != null) {
        trainingPlan.equipment.add(item);
      }
    }

    // --------------------------------------------------
    // ACTIVE SLOTS
    // --------------------------------------------------

    final activeSlots =
        data['activeSlots'] as List<String>;

    for (final slotName in activeSlots) {
      final slot = _findEquipmentSlot(slotName);

      if (slot != null) {
        trainingPlan.activateSlot(slot);
      }
    }

    // --------------------------------------------------
    // COOLDOWNS
    // --------------------------------------------------

    final cooldownData =
        data['cooldowns'] as Map<String, String>;

    for (final entry in cooldownData.entries) {
      final timestamp =
          int.tryParse(entry.value);

      if (timestamp == null) {
        continue;
      }

      trainingPlan.cooldowns[entry.key] =
          DateTime.fromMillisecondsSinceEpoch(
        timestamp,
      );
    }
  }

  // --------------------------------------------------
  // SAVE
  // --------------------------------------------------

  Future<void> saveTrainingPlan() async {
    await storage.saveTrainingPlan(
      equipmentIds: trainingPlan.equipment
          .map((item) => item.id)
          .toList(),

      activeSlots: trainingPlan.activeSlots
          .map((slot) => slot.name)
          .toList(),

      cooldowns: trainingPlan.cooldowns,
    );
  }

  // --------------------------------------------------
  // FIND EQUIPMENT
  // --------------------------------------------------

  EquipmentItem? _findEquipmentItem(
    String id,
  ) {
    for (final item in equipmentItems) {
      if (item.id == id) {
        return item;
      }
    }

    return null;
  }

  // --------------------------------------------------
  // FIND SLOT
  // --------------------------------------------------

  EquipmentSlot? _findEquipmentSlot(
    String name,
  ) {
    for (final slot in EquipmentSlot.values) {
      if (slot.name == name) {
        return slot;
      }
    }

    return null;
  }
}