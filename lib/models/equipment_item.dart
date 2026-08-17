import 'exercise.dart';
import 'equipment_slot.dart';
import 'rarity.dart';
import 'equipment_requirement.dart';

class EquipmentItem {
  final String id;
  final String name;
  final List<Exercise> exercises;
  final Rarity rarity;
  final EquipmentSlot slot;
  final int cooldownHours;
  final EquipmentRequirement unlockRequirements;
  final EquipmentRequirement equipRequirements;


  const EquipmentItem({
    required this.id,
    required this.name,
    required this.exercises,
    required this.rarity,
    required this.slot,
    required this.cooldownHours,
    required this.unlockRequirements,
    required this.equipRequirements,
  });
}