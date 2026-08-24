import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/equipment_requirement.dart';
import '../models/rarity.dart';
import 'exercises.dart';

final List<EquipmentItem> equipmentItems = [
  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_novato',
    name: 'CASCO DEL NOVATO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,

    unlockRequirements: EquipmentRequirement(),

    equipRequirements: EquipmentRequirement(),

    stats: {
      'stamina': 2,
    },

    exercises: [
      EquipmentExercise(
        exercise: exercises[0],
        maxVariant: 0,
      ),
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
      },
    ),

    stats: {
      'stamina': 3,
    },

    exercises: [
      EquipmentExercise(
        exercise: exercises[0],
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_novato',
    name: 'PECHERA DEL NOVATO',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,

    unlockRequirements: EquipmentRequirement(),

    equipRequirements: EquipmentRequirement(),

    stats: {
      'strength': 2,
    },

    exercises: [
      EquipmentExercise(
        exercise: exercises[1],
        maxVariant: 0,
      ),

      EquipmentExercise(
        exercise: exercises[2],
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // TEST / SPECIAL
  // --------------------------------------------------

  EquipmentItem(
    id: 'mejora_nivel',
    name: 'CARAMELORARO',
    rarity: Rarity.legendary,
    slot: EquipmentSlot.wings,
    cooldownHours: 0,

    unlockRequirements: EquipmentRequirement(),

    equipRequirements: EquipmentRequirement(),

    stats: {
      'strength': 30,
      'endurance': 30,
      'energy': 30,
      'stamina': 30,
    },

    exercises: [
      EquipmentExercise(
        exercise: exercises[3],
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // TEST / UNEQUIPPABLE
  // --------------------------------------------------

  EquipmentItem(
    id: 'item_inequipable',
    name: 'INEQUIPABLE',
    rarity: Rarity.legendary,
    slot: EquipmentSlot.belt,
    cooldownHours: 0,

    unlockRequirements: EquipmentRequirement(),

    equipRequirements: EquipmentRequirement(
      stats: {
        'stamina': 100000,
      },
    ),

    stats: {},

    exercises: [
      EquipmentExercise(
        exercise: exercises[0],
        maxVariant: 0,
      ),
    ],
  ),
];