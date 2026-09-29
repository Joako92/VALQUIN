import 'equipment_slot.dart';

enum MuscleGroup {
  shoulders,
  cardio,
  back,
  biceps,
  chest,
  triceps,
  legs,
  core;

  static MuscleGroup? fromSlot(EquipmentSlot slot) {
    switch (slot) {
      case EquipmentSlot.shoulders:
        return MuscleGroup.shoulders;

      case EquipmentSlot.head:
        return MuscleGroup.cardio;

      case EquipmentSlot.wings:
        return MuscleGroup.back;

      case EquipmentSlot.weapon:
        return MuscleGroup.biceps;

      case EquipmentSlot.chest:
        return MuscleGroup.chest;

      case EquipmentSlot.shield:
        return MuscleGroup.triceps;

      case EquipmentSlot.legs:
        return MuscleGroup.legs;

      case EquipmentSlot.belt:
        return MuscleGroup.core;

      case EquipmentSlot.accessory:
        return null;
    }
  }
}