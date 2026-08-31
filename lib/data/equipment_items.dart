import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
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
    id: 'gorra_cuero',
    name: 'GORRA DE CUERO',
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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    unlockRequirements: Requirement(),
    equipRequirements: Requirement(),

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

    // 1 caminata = +5 stamina +5 energy
    unlockRequirements: Requirement(
      stats: {
        'stamina': 5,
        'energy': 5,
      },
    ),

    // 3 caminatas = +15 stamina +15 energy
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
    id: 'hombrera_hierro',
    name: 'HOMBRERA DE HIERRO',
    rarity: Rarity.common,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 24,

    // 1 press militar = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 press militar = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'vuelo_lateral',
        maxVariant: 0,
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
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 sesiones de flexiones = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  EquipmentItem(
    id: 'cuchillas_livianas',
    name: 'CUCHILLAS LIVIANAS',
    rarity: Rarity.common,
    slot: EquipmentSlot.weapon,
    cooldownHours: 24,

    // 1 curl de bíceps = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 curls de bíceps = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_alternado',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pantalones_cota',
    name: 'PANTALONES DE COTA',
    rarity: Rarity.common,
    slot: EquipmentSlot.legs,
    cooldownHours: 24,

    // 1 sentadilla = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 sentadillas = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 20,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'sentadilla_carga',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'cinturon_reforzado',
    name: 'CINTURÓN REFORZADO',
    rarity: Rarity.common,
    slot: EquipmentSlot.belt,
    cooldownHours: 24,

    // 1 plancha = +10 strength +10 endurance
    unlockRequirements: Requirement(
      stats: {
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 planchas = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'crunches',
        maxVariant: 0,
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
        'strength': 10,
        'endurance': 10,
      },
    ),

    // 3 fondos en banco = +30 strength +30 endurance
    equipRequirements: Requirement(
      stats: {
        'strength': 30,
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'triceps_polea',
        maxVariant: 0,
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

    // 1 ejercicio que otorga endurance.
    unlockRequirements: Requirement(
      stats: {
        'endurance': 10,
      },
    ),

    // 3 sesiones = +30 endurance
    equipRequirements: Requirement(
      stats: {
        'endurance': 30,
      },
    ),

    stats: {
      'strength': 15,
      'endurance': 10,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'polea_pecho',
        maxVariant: 0,
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
        'energy': 10,
        'stamina': 10,
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
    id: 'visera_bronce',
    name: 'VISERA DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.head,
    cooldownHours: 24,

    // 3 km de trote = +15 stamina +15 energy
    unlockRequirements: Requirement(
      stats: {
        'stamina': 15,
        'energy': 15,
      },
    ),

    // 6 km de progreso de trote acumulado = +30 stamina +30 energy
    equipRequirements: Requirement(
      stats: {
        'stamina': 30,
        'energy': 30,
      },
    ),

    stats: {
      'stamina': 20,
      'energy': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'saltos_soga',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'pectoral_bronce',
    name: 'PECTORAL DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.chest,
    cooldownHours: 24,

    // 1 sesión de flexiones = +10 strength +10 endurance.
    // 3 sesiones = +30 strength +30 endurance.
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
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'aperturas_mancuernas',
        maxVariant: 0,
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
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'vuelo_frontal',
        maxVariant: 0,
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
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'curl_martillo',
        maxVariant: 0,
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
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'extension_triceps',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'pollera_bronce',
    name: 'POLLERA DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.legs,
    cooldownHours: 24,

    unlockRequirements: Requirement(
      stats: {
        'strength': 20,
        'endurance': 20,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 40,
        'endurance': 40,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'prensa_piernas',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  EquipmentItem(
    id: 'faja_bronce',
    name: 'FAJA DE BRONCE',
    rarity: Rarity.common,
    slot: EquipmentSlot.belt,
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
        exerciseId: 'elevaciones_piernas',
        maxVariant: 0,
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
        'strength': 20,
        'endurance': 20,
      },
    ),

    equipRequirements: Requirement(
      stats: {
        'strength': 40,
        'endurance': 40,
      },
    ),

    stats: {
      'strength': 10,
      'endurance': 15,
    },

    exercises: [
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 0,
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
    id: 'capucha_sabio',
    name: 'CAPUCHA DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.head,
    cooldownHours: 36,

    // 30 stamina + 30 energy.
    unlockRequirements: Requirement(
      stats: {
        'stamina': 30,
        'energy': 30,
      },
    ),

    // 60 stamina + 60 energy.
    equipRequirements: Requirement(
      stats: {
        'stamina': 60,
        'energy': 60,
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
        maxVariant: 1,
      ),
      EquipmentExercise(
        exerciseId: 'saltos_soga',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  EquipmentItem(
    id: 'tunica_sabio',
    name: 'TÚNICA DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.chest,
    cooldownHours: 36,

    // 60 strength + 60 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    // 90 strength + 90 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 90,
        'endurance': 90,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'press_banca',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  EquipmentItem(
    id: 'manto_sabio',
    name: 'MANTO DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.shoulders,
    cooldownHours: 36,

    // 60 strength + 60 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    // 90 strength + 90 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 90,
        'endurance': 90,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'vuelo_lateral',
        maxVariant: 0,
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

    // 60 strength + 60 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    // 90 strength + 90 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 90,
        'endurance': 90,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'curl_alternado',
        maxVariant: 0,
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

    // 60 strength + 60 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    // 90 strength + 90 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 90,
        'endurance': 90,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'triceps_polea',
        maxVariant: 0,
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  EquipmentItem(
    id: 'grebas_sabio',
    name: 'GREBAS DEL SABIO',
    rarity: Rarity.rare,
    slot: EquipmentSlot.legs,
    cooldownHours: 36,

    // 40 strength + 40 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 40,
        'endurance': 40,
      },
    ),

    // 60 strength + 60 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'sentadilla_carga',
        maxVariant: 0,
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

    // 60 strength + 60 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
      },
    ),

    // 90 strength + 90 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 90,
        'endurance': 90,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'crunches',
        maxVariant: 0,
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

    // 40 strength + 40 endurance.
    unlockRequirements: Requirement(
      stats: {
        'strength': 40,
        'endurance': 40,
      },
    ),

    // 60 strength + 60 endurance.
    equipRequirements: Requirement(
      stats: {
        'strength': 60,
        'endurance': 60,
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
        maxVariant: 0,
      ),
      EquipmentExercise(
        exerciseId: 'remo_sentado',
        maxVariant: 0,
      ),
    ],
  ),
];
