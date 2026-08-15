import 'exercise.dart';
import 'equipment_slot.dart';
import 'rarity.dart';

class EquipmentItem {
  final String id;
  final String name;
  final List<Exercise> exercises;
  final Rarity rarity;
  final EquipmentSlot slot;
  final int cooldownHours;

  const EquipmentItem({
    required this.id,
    required this.name,
    required this.exercises,
    required this.rarity,
    required this.slot,
    required this.cooldownHours,
  });
}