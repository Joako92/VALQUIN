import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/player_class.dart';
import '../models/requirement.dart';
import '../models/rarity.dart';

final List<EquipmentItem> equipmentItems = [
  // ==================================================
  // SET DE CUERO
  // ==================================================

  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_cuero',
    name: 'CASCO DE CUERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,

    // Starter equipment.
    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'stamina': 5,
      'energy': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'caminata',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'flexiones_brazos',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_militar',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_biceps',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'fondos_banco',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'sentadilla_libre',
        maxVariant: 1,
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'plancha_frontal',
        maxVariant: 1,
      ),
    ],
  ),

  // ==================================================
  // SET DE HIERRO
  // ==================================================

  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_hierro',
    name: 'CASCO DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'stamina': 5,
        'energy': 5,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'stamina': 15,
        'energy': 15,
      },
    ),

    stats: {
      'energy': 10,
      'stamina': 20,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'trote',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'hombreras_hierro',
    name: 'HOMBRERAS DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'vuelo_lateral',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_hierro',
    name: 'PECHERA DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,

    // 1 sesión de flexiones = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    // 3 sesiones de flexiones = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  EquipmentItem(
    id: 'cuchillas_livianas',
    name: 'CUCHILLA LIVIANA',
    rarity: Rarity.common,
    slot: EquipmentSlot.weapon,
    cooldownHours: 24,

    // 1 curl de bíceps = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    // 3 curls de bíceps = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_alternado',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_hierro',
    name: 'PANTALONES DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.legs,
    cooldownHours: 24,

    // 1 sentadilla = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    // 3 sentadillas = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'sentadilla_carga',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_hierro',
    name: 'CINTURÓN HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.belt,
    cooldownHours: 24,

    // 1 plancha = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    // 3 planchas = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'crunches',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  EquipmentItem(
    id: 'escudo_hierro',
    name: 'ESCUDO DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.shield,
    cooldownHours: 24,

    // 1 fondo en banco = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    // 3 fondos en banco = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'triceps_polea',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // WINGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'capa_viajero',
    name: 'CAPA DEL VIAJERO',
    rarity: Rarity.common,
    slot: EquipmentSlot.wings,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'polea_pecho',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // ACCESSORY
  // --------------------------------------------------

  EquipmentItem(
    id: 'bitacora_semanal',
    name: 'BITÁCORA SEMANAL',
    rarity: Rarity.common,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'strength': 10,
        'endurance': 10,
        'energy': 5,
        'stamina': 5,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
        'energy': 30,
        'stamina': 30,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 10,
      'energy': 10,
      'stamina': 10,
    },

    exercises: [],
  ),

  // ==================================================
  // SET DE BRONCE
  // ==================================================

  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_bronce',
    name: 'CASCO DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'stamina': 20,
        'energy': 20,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'stamina': 50,
        'energy': 50,
      },
    ),

    stats: {
      'stamina': 20,
      'energy': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'saltos_soga',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_bronce',
    name: 'PECHERA DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'aperturas_mancuernas',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'hombreras_bronce',
    name: 'HOMBRERAS DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'vuelo_frontal',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  EquipmentItem(
    id: 'daga_larga',
    name: 'DAGA LARGA',
    rarity: Rarity.common,
    slot: EquipmentSlot.weapon,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_martillo',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  EquipmentItem(
    id: 'escudo_largo',
    name: 'ESCUDO LARGO',
    rarity: Rarity.common,
    slot: EquipmentSlot.shield,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'extension_triceps',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_bronce',
    name: 'PANTALONES DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.legs,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'prensa_piernas',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_bronce',
    name: 'CINTURÓN DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.belt,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'elevaciones_piernas',
        maxVariant: 1,
      ),
    ],
  ),

  // --------------------------------------------------
  // WINGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'capa_pesada',
    name: 'CAPA PESADA',
    rarity: Rarity.common,
    slot: EquipmentSlot.wings,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 50,
        'endurance': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 1,
      ),
    ],
  ),

  // ==================================================
  // SET DEL SABIO
  // ==================================================

  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_sabio',
    name: 'CASCO DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.head,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'stamina': 50,
        'energy': 50,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'stamina': 80,
        'energy': 80,
      },
    ),

    stats: {
      'strength': 5,
      'endurance': 10,
      'energy': 20,
      'stamina': 30,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'trote',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'saltos_soga',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_sabio',
    name: 'PECHERA DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.chest,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 30,
      'endurance': 20,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'flexiones_brazos',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'hombreras_sabio',
    name: 'HOMBRERAS DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 30,
      'endurance': 20,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_militar',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'vuelo_lateral',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  EquipmentItem(
    id: 'baston_sabio',
    name: 'BASTÓN DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.weapon,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 30,
      'endurance': 20,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_biceps',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'curl_alternado',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  EquipmentItem(
    id: 'egida_sabio',
    name: 'ÉGIDA DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.shield,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 30,
      'endurance': 20,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'fondos_banco',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'triceps_polea',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_sabio',
    name: 'BOTAS DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.legs,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 30,
      'energy': 5,
      'stamina': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'sentadilla_libre',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'sentadilla_carga',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_sabio',
    name: 'CINTURÓN DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.belt,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 25,
      'endurance': 15,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'plancha_frontal',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'crunches',
        maxVariant: 2,
      ),
    ],
  ),

  // --------------------------------------------------
  // WINGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'capa_sabio',
    name: 'CAPA DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.wings,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 130,
        'endurance': 130,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 30,
      'energy': 5,
      'stamina': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'polea_pecho',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 2,
      ),
    ],
  ),

  // ==================================================
  // ITEMS ESPECIFICOS DE CLASE
  // ==================================================

  // ==================================================
  // Power Lifter
  // ==================================================

  EquipmentItem(
    id: 'pechera_atlas',
    name: 'PECHERA DE ATLAS',
    rarity: Rarity.rare,
    slot: EquipmentSlot.chest,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 100,
      },
      classes: {
        PlayerClass.powerLifter,
        PlayerClass.bodybuilder,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 140,
      },
    ),

    stats: {
      'strength': 60,
      'endurance': 15,
      'energy': 5,
      'stamina': 0,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'flexiones_brazos',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'aperturas_mancuernas',
        maxVariant: 2,
      ),
    ],
  ),

  EquipmentItem(
    id: 'guantes_atlas',
    name: 'GUANTE DE ATLAS',
    rarity: Rarity.rare,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 30,
      },
      classes: {
        PlayerClass.powerLifter,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 120,
        'endurance': 50,
      },
    ),

    stats: {
      'strength': 50,
      'endurance': 25,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [],
  ),

  // ==================================================
  // Bodybuilder
  // ==================================================

  EquipmentItem(
    id: 'espada_heracles',
    name: 'ESPADA DE HERACLES',
    rarity: Rarity.rare,
    slot: EquipmentSlot.weapon,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'endurance': 100,
      },
      classes: {
        PlayerClass.powerLifter,
        PlayerClass.bodybuilder,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'endurance': 140,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 60,
      'energy': 5,
      'stamina': 0,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_biceps',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'curl_alternado',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'curl_barra',
        maxVariant: 2,
      ),
    ],
  ),

  EquipmentItem(
    id: 'pegaso',
    name: 'PEGASO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'endurance': 80,
        'strength': 30,
      },
      classes: {
        PlayerClass.bodybuilder,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'endurance': 120,
        'strength': 50,
      },
    ),

    stats: {
      'strength': 25,
      'endurance': 50,
      'energy': 10,
      'stamina': 5,
    },

    exercises: [],
  ),

  // ==================================================
  // Gymnast
  // ==================================================

  EquipmentItem(
    id: 'brazales_hermes',
    name: 'BRAZAL DE HERMES',
    rarity: Rarity.rare,
    slot: EquipmentSlot.shield,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'energy': 100,
      },
      classes: {
        PlayerClass.powerLifter,
        PlayerClass.bodybuilder,
        PlayerClass.athlete,
        PlayerClass.gymnast,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'energy': 140,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 60,
      'energy': 5,
      'stamina': 0,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'fondos_banco',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'triceps_polea',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'extension_triceps',
        maxVariant: 2,
      ),
    ],
  ),

  EquipmentItem(
    id: 'pluma_icaro',
    name: 'PLUMA DE ÍCARO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'energy': 80,
        'stamina': 30,
      },
      classes: {
        PlayerClass.gymnast,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'energy': 120,
        'stamina': 50,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 10,
      'energy': 50,
      'stamina': 25,
    },

    exercises: [],
  ),

  // ==================================================
  // Runner
  // ==================================================

  EquipmentItem(
    id: 'casco_atalanta',
    name: 'CASCO DE ATALANTA',
    rarity: Rarity.rare,
    slot: EquipmentSlot.head,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'stamina': 100,
      },
      classes: {
        PlayerClass.runner,
        PlayerClass.gymnast,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'stamina': 140,
      },
    ),

    stats: {
      'strength': 0,
      'endurance': 10,
      'energy': 20,
      'stamina': 60,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'trote',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'saltos_soga',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'caminata',
        maxVariant: 2,
      ),
    ],
  ),

  EquipmentItem(
    id: 'sandalias_hermes',
    name: 'SANDALIAS DE HERMES',
    rarity: Rarity.rare,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'energy': 30,
        'stamina': 80,
      },
      classes: {
        PlayerClass.runner,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'energy': 50,
        'stamina': 120,
      },
    ),

    stats: {
      'strength': 5,
      'endurance': 10,
      'energy': 25,
      'stamina': 50,
    },

    exercises: [],
  ),

  // ==================================================
  // Athlete
  // ==================================================

  EquipmentItem(
    id: 'capa_campeon',
    name: 'CAPA DEL CAMPEÓN',
    rarity: Rarity.rare,
    slot: EquipmentSlot.wings,
    cooldownHours: 36,

    unlockRequirements: Requirement(
      stats: {
        'strength': 80,
        'endurance': 80,
        'energy': 40,
        'stamina': 40,
      },
      classes: {
        PlayerClass.powerLifter,
        PlayerClass.bodybuilder,
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 140,
        'endurance': 140,
        'energy': 80,
        'stamina': 80,
      },
    ),

    stats: {
      'strength': 40,
      'endurance': 40,
      'energy': 10,
      'stamina': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'polea_pecho',
        maxVariant: 2,
      ),
      EquipmentExercise(
        exerciseId: 'remo_barra',
        maxVariant: 2,
      ),
    ],
  ),

  EquipmentItem(
    id: 'laurel_apolo',
    name: 'LAUREL DE APOLO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.accessory,
    cooldownHours: 168,

    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
        'energy': 60,
        'stamina': 60,
      },
      classes: {
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 100,
        'endurance': 100,
        'energy': 80,
        'stamina': 80,
      },
    ),

    stats: {
      'strength': 25,
      'endurance': 25,
      'energy': 25,
      'stamina': 25,
    },

    exercises: [],
  ),

  // ==================================================
  // Alas Angel
  // ==================================================

  EquipmentItem(
    id: 'alas_angel',
    name: 'ALAS DE ANGEL',
    rarity: Rarity.legendary,
    slot: EquipmentSlot.wings,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 1000,
        'endurance': 1000,
        'energy': 500,
        'stamina': 500,
      },
      classes: {
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 1000,
        'endurance': 1000,
        'energy': 500,
        'stamina': 500,
      },
    ),

    stats: {
      'strength': 100,
      'endurance': 100,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'polea_pecho',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'remo_barra',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'dominadas',
        maxVariant: 4,
      ),
    ],
  ),

  // ==================================================
  // DRAGON SET
  // ==================================================

  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  EquipmentItem(
    id: 'casco_dragon',
    name: 'CASCO DEL DRAGÓN',
    rarity: Rarity.mythic,
    slot: EquipmentSlot.head,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'stamina': 2000,
        'energy': 2000,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'stamina': 2000,
        'energy': 2000,
      },
    ),

    stats: {
      'strength': 200,
      'endurance': 200,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'trote',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'ciclismo',
        maxVariant: 4,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pechera_dragon',
    name: 'PECHERA DEL DRAGÓN',
    rarity: Rarity.mythic,
    slot: EquipmentSlot.chest,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    stats: {
      'strength': 200,
      'endurance': 200,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'press_declinado',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'aperturas_mancuernas',
        maxVariant: 4,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'hombreras_dragon',
    name: 'HOMBRERAS DEL DRAGÓN',
    rarity: Rarity.mythic,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    stats: {
      'strength': 200,
      'endurance': 200,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_arnold',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'vuelo_frontal',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'vuelo_lateral',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'vuelo_posterior',
        maxVariant: 4,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_dragon',
    name: 'BOTAS DEL DRAGÓN',
    rarity: Rarity.mythic,
    slot: EquipmentSlot.legs,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    stats: {
      'strength': 200,
      'endurance': 200,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'prensa_piernas',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'sentadilla_carga',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'sentadilla_bulgara',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'peso_muerto',
        maxVariant: 4,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_dragon',
    name: 'CINTURÓN DEL DRAGÓN',
    rarity: Rarity.mythic,
    slot: EquipmentSlot.belt,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 2000,
        'endurance': 2000,
      },
    ),

    stats: {
      'strength': 200,
      'endurance': 200,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'v_ups',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'crunches',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'crunches_rotacion',
        maxVariant: 4,
      ),
    ],
  ),

  // ==================================================
  // Alas Dragon
  // ==================================================

  EquipmentItem(
    id: 'alas_dragon',
    name: 'ALAS DE DRAGÓN',
    rarity: Rarity.legendary,
    slot: EquipmentSlot.wings,
    cooldownHours: 1,

    unlockRequirements: Requirement(
      stats: {
        'strength': 1000,
        'endurance': 1000,
        'energy': 500,
        'stamina': 500,
      },
      classes: {
        PlayerClass.athlete,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 1000,
        'endurance': 1000,
        'energy': 500,
        'stamina': 500,
      },
    ),

    stats: {
      'strength': 100,
      'endurance': 100,
      'energy': 100,
      'stamina': 100,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'dominadas',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'pullover',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 4,
      ),
      EquipmentExercise(
        exerciseId: 'remo_mancuerna',
        maxVariant: 4,
      ),
    ],
  ),

];
