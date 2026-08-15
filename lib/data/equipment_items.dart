import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/rarity.dart';
import 'exercises.dart';

final List<EquipmentItem> equipmentItems = [
  EquipmentItem(
    id: 'casco_alado_hermes',
    name: 'CASCO ALADO DE HERMES',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 48,
    exercises: [
      exercises[0],
    ],
  ),

  EquipmentItem(
    id: 'corona_laureles_nike',
    name: 'CORONA DE LAURELES DE NIKÉ',
    rarity: Rarity.rare,
    slot: EquipmentSlot.head,
    cooldownHours: 24,
    exercises: [
      exercises[2],
    ],
  ),

  EquipmentItem(
    id: 'pechera_guerrero',
    name: 'PECHERA DEL GUERRERO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.chest,
    cooldownHours: 48,
    exercises: [
      exercises[1],
      exercises[3],
    ],
  ),
];