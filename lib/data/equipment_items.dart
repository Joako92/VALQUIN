import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/equipment_requirement.dart';
import '../models/rarity.dart';
import 'exercises.dart';

final List<EquipmentItem> equipmentItems = [
  EquipmentItem(
    id: 'casco_novato',
    name: 'CASCO DEL NOVATO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    exercises: [
      exercises[0],
    ],
  ),

  EquipmentItem(
    id: 'casco_mejorado',
    name: 'CORONA DE LAURELES DE NIKÉ',
    rarity: Rarity.rare,
    slot: EquipmentSlot.head,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(
      level: 2,
    ),
    equipRequirements: EquipmentRequirement(
      stats: {
        'stamina': 10,
      }
    ),
    exercises: [
      exercises[2],
    ],
  ),

  EquipmentItem(
    id: 'pechera_novato',
    name: 'PECHERA DEL NOVATO',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    exercises: [
      exercises[1],
      exercises[3],
    ],
  ),

  EquipmentItem(
    id: 'mejora_nivel',
    name: 'CARAMELORARO',
    rarity: Rarity.epic,
    slot: EquipmentSlot.wings,
    cooldownHours: 0,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    exercises: [
      exercises[4],
    ],
  ),

  EquipmentItem(
    id: 'item_inequipable',
    name: 'INEQUIPABLE',
    rarity: Rarity.epic,
    slot: EquipmentSlot.belt,
    cooldownHours: 0,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(
      stats: {
        'stamina': 100000,
      }
    ),
    exercises: [
      exercises[0],
    ],
  ),
];