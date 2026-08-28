import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/equipment_requirement.dart';
import '../models/rarity.dart';

final List<EquipmentItem> equipmentItems = [
  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'gorra_cuero',
    name: 'GORRA DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'stamina': 5,
      'energy': 5,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'caminata',
        maxVariant: 0,
      ),
    ],
  ),

  EquipmentItem(
    id: 'vincha_cuero',
    name: 'VINCHA DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'stamina': 10,
      'energy': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'trote',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_cuero',
    name: 'PECHERA DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'flexiones_brazos',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'hombreras_cuero',
    name: 'HOMBRERAS DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'press_militar',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  EquipmentItem(
    id: 'baculo_madera',
    name: 'BÁCULO DE MADERA',
    rarity: Rarity.common,
    slot: EquipmentSlot.weapon,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_biceps',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  EquipmentItem(
    id: 'escudo_madera',
    name: 'ESCUDO DE MADERA',
    rarity: Rarity.common,
    slot: EquipmentSlot.shield,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'fondos_banco',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_cuero',
    name: 'PANTALONES DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.legs,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'sentadilla_libre',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_cuero',
    name: 'CINTURÓN DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.belt,
    cooldownHours: 24,
    unlockRequirements: EquipmentRequirement(),
    equipRequirements: EquipmentRequirement(),
    stats: {
      'strength': 10,
      'endurance': 10,
    },
    exercises: [
      EquipmentExercise(
        exerciseId: 'plancha_frontal',
        maxVariant: 0,
      ),
    ],
  ),
];