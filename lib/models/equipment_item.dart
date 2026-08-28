// import 'exercise.dart';
import 'equipment_slot.dart';
import 'rarity.dart';
import 'equipment_requirement.dart';

class EquipmentExercise {
  final String exerciseId;
  final int maxVariant;

  const EquipmentExercise({
    required this.exerciseId,
    this.maxVariant = 0,
  });
}

class EquipmentItem {
  final String id;
  final String name;

  final List<EquipmentExercise> exercises;

  final Rarity rarity;
  final EquipmentSlot slot;

  final int cooldownHours;

  final EquipmentRequirement unlockRequirements;
  final EquipmentRequirement equipRequirements;

  // --------------------------------------------------
  // STATS
  // --------------------------------------------------

  final Map<String, int> stats;

  const EquipmentItem({
    required this.id,
    required this.name,
    required this.exercises,
    required this.rarity,
    required this.slot,
    required this.cooldownHours,
    required this.unlockRequirements,
    required this.equipRequirements,
    this.stats = const {},
  });
}