import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/player.dart';

enum EquipResultType {
  equipped,
  replaced,
  blockedByCooldown,
}

class EquipResult {
  final EquipResultType type;
  final EquipmentItem? item;

  const EquipResult({
    required this.type,
    this.item,
  });
}

class TrainingPlan {
  // --------------------------------------------------
  // EQUIPPED ITEMS
  // --------------------------------------------------

  final List<EquipmentItem> equipment = [];

  // --------------------------------------------------
  // ACTIVE SLOTS
  // --------------------------------------------------

  final List<EquipmentSlot> activeSlots = [];

  // --------------------------------------------------
  // COOLDOWNS
  // --------------------------------------------------

  // Guarda cuándo comenzó el cooldown de cada item.
  //
  // key   = id del EquipmentItem
  // value = momento en que fue ejecutado
  final Map<String, DateTime> cooldowns = {};

  // --------------------------------------------------
  // EQUIP
  // --------------------------------------------------

  bool containsItem(EquipmentItem item) {
    return equipment.contains(item);
  }

  EquipResult addItem(EquipmentItem item) {
    for (final equippedItem in equipment) {
      if (equippedItem.slot == item.slot) {
        if (isOnCooldown(equippedItem)) {
          return EquipResult(
            type: EquipResultType.blockedByCooldown,
            item: equippedItem,
          );
        }

        equipment.remove(equippedItem);
        equipment.add(item);

        return EquipResult(
          type: EquipResultType.replaced,
          item: equippedItem,
        );
      }
    }

    equipment.add(item);

    return EquipResult(
      type: EquipResultType.equipped,
      item: item,
    );
  }

  bool removeItem(EquipmentItem item) {
    // No se puede desequipar durante el cooldown.
    if (isOnCooldown(item)) {
      return false;
    }

    equipment.remove(item);

    return true;
  }

  // --------------------------------------------------
  // ACTIVE
  // --------------------------------------------------

  void activateSlot(EquipmentSlot slot) {
    if (!activeSlots.contains(slot)) {
      activeSlots.add(slot);
    }
  }

  void deactivateSlot(EquipmentSlot slot) {
    activeSlots.remove(slot);
  }

  bool isSlotActive(EquipmentSlot slot) {
    return activeSlots.contains(slot);
  }

  void toggleSlot(EquipmentSlot slot) {
    if (isSlotActive(slot)) {
      deactivateSlot(slot);
    } else {
      activateSlot(slot);
    }
  }

  // --------------------------------------------------
  // SLOT
  // --------------------------------------------------

  List<EquipmentItem> itemsForSlot(EquipmentSlot slot) {
    return equipment
        .where((item) => item.slot == slot)
        .toList();
  }

  List<EquipmentItem> activeItemsForSlot(EquipmentSlot slot) {
    if (!isSlotActive(slot)) {
      return [];
    }

    return itemsForSlot(slot);
  }

  // --------------------------------------------------
  // COOLDOWN
  // --------------------------------------------------

  bool isOnCooldown(EquipmentItem item) {
    final cooldownStart = cooldowns[item.id];

    if (cooldownStart == null) {
      return false;
    }

    final cooldownEnd = cooldownStart.add(
      Duration(hours: item.cooldownHours),
    );

    return DateTime.now().isBefore(cooldownEnd);
  }

  DateTime? cooldownUntil(EquipmentItem item) {
    final cooldownStart = cooldowns[item.id];

    if (cooldownStart == null) {
      return null;
    }

    return cooldownStart.add(
      Duration(hours: item.cooldownHours),
    );
  }

  // --------------------------------------------------
  // EXECUTE
  // --------------------------------------------------

  Map<String, int> execute(Player player) {
    final Map<String, int> gainedStats = {};

    for (final item in equipment) {
      if (!isSlotActive(item.slot)) {
        continue;
      }

      if (isOnCooldown(item)) {
        continue;
      }

      for (final exercise in item.exercises) {
        player.addStats(exercise.stats);

        exercise.stats.forEach((stat, value) {
          gainedStats[stat] =
              (gainedStats[stat] ?? 0) + value;
        });
      }

      cooldowns[item.id] = DateTime.now();
    }

    return gainedStats;
  }
}