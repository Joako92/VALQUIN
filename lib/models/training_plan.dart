import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';

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
  // EQUIP
  // --------------------------------------------------

  void addItem(EquipmentItem item) {
    if (!equipment.contains(item)) {
      equipment.add(item);
    }
  }

  void removeItem(EquipmentItem item) {
    equipment.remove(item);
  }

  bool containsItem(EquipmentItem item) {
    return equipment.contains(item);
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
}