import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/equipment_requirement.dart';
import '../models/player.dart';

enum EquipResultType {
  equipped,
  replaced,
  blockedByCooldown,
  blockedByUnlockRequirement,
  blockedByEquipRequirement,
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

  final Map<String, DateTime> cooldowns = {};

  // --------------------------------------------------
  // REQUIREMENTS
  // --------------------------------------------------

  bool meetsRequirements(
    EquipmentRequirement requirements,
    Player player,
  ) {
    // LEVEL
    if (requirements.level != null) {
      if (player.level < requirements.level!) {
        return false;
      }
    }

    // STATS
    for (final entry in requirements.stats.entries) {
      final currentValue = player.getStat(entry.key);

      if (currentValue < entry.value) {
        return false;
      }
    }

    return true;
  }

  bool isItemUnlocked(
    EquipmentItem item,
    Player player,
  ) {
    return meetsRequirements(
      item.unlockRequirements,
      player,
    );
  }

  bool canEquipItem(
    EquipmentItem item,
    Player player,
  ) {
    return meetsRequirements(
      item.equipRequirements,
      player,
    );
  }

  // --------------------------------------------------
  // EQUIP
  // --------------------------------------------------

  bool containsItem(EquipmentItem item) {
    return equipment.any(
      (equippedItem) => equippedItem.id == item.id,
    );
  }

  EquipResult addItem(
    EquipmentItem item,
    Player player,
  ) {
    // --------------------------------------------------
    // UNLOCK REQUIREMENTS
    // --------------------------------------------------

    if (!isItemUnlocked(item, player)) {
      return EquipResult(
        type: EquipResultType.blockedByUnlockRequirement,
        item: item,
      );
    }

    // --------------------------------------------------
    // EQUIP REQUIREMENTS
    // --------------------------------------------------

    if (!canEquipItem(item, player)) {
      return EquipResult(
        type: EquipResultType.blockedByEquipRequirement,
        item: item,
      );
    }

    // --------------------------------------------------
    // SLOT
    // --------------------------------------------------

    for (final equippedItem in equipment) {
      if (equippedItem.slot == item.slot) {
        // No podemos reemplazar un item
        // que está en cooldown.
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

    // --------------------------------------------------
    // EQUIP
    // --------------------------------------------------

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

    equipment.removeWhere(
      (equippedItem) => equippedItem.id == item.id,
    );

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

  List<EquipmentItem> itemsForSlot(
    EquipmentSlot slot,
  ) {
    return equipment
        .where((item) => item.slot == slot)
        .toList();
  }

  List<EquipmentItem> activeItemsForSlot(
    EquipmentSlot slot,
  ) {
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

      // --------------------------------------------------
      // STATS
      // --------------------------------------------------

      player.addStats(item.stats);

      item.stats.forEach((stat, value) {
        gainedStats[stat] =
            (gainedStats[stat] ?? 0) + value;
      });

      // --------------------------------------------------
      // COOLDOWN
      // --------------------------------------------------

      cooldowns[item.id] = DateTime.now();
    }

    return gainedStats;
  }
}