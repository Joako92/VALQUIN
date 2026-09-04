import '../models/exercise.dart';

const List<Exercise> exercises = [
  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  Exercise(
    id: 'caminata',
    name: 'CAMINATA',
    variants: [
      ExerciseVariant(
        index: 0,
        amount: 30,
        unit: 'min',
      ),
      ExerciseVariant(
        index: 1,
        amount: 60,
        unit: 'min',
      ),
    ],
  ),

  Exercise(
    id: 'trote',
    name: 'TROTE',
    variants: [
      ExerciseVariant(
        index: 0,
        amount: 1,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 1,
        amount: 3,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 2,
        amount: 5,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 3,
        amount: 10,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 4,
        amount: 1,
        unit: 'hs',
      ),
    ],
  ),

  Exercise(
    id: 'saltos_soga',
    name: 'SALTOS CON SOGA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 30,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 50,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  Exercise(
    id: 'flexiones_brazos',
    name: 'FLEXIONES',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 3,
        amount: 15,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 2,
        sets: 3,
        amount: 20,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 3,
        sets: 4,
        amount: 20,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 4,
        sets: 4,
        amount: 25,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'press_banca',
    name: 'PRESS BANCA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'aperturas_mancuernas',
    name: 'APERTURAS CON MANCUERNAS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  Exercise(
    id: 'press_militar',
    name: 'PRESS MILITAR',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'vuelo_lateral',
    name: 'VUELO LATERAL',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'vuelo_frontal',
    name: 'VUELO FRONTAL',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // WEAPON
  // --------------------------------------------------

  Exercise(
    id: 'curl_biceps',
    name: 'CURL DE BÍCEPS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'curl_alternado',
    name: 'CURL ALTERNADO',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'curl_barra',
    name: 'CURL CON BARRA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  Exercise(
    id: 'fondos_banco',
    name: 'FONDOS EN BANCO',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'triceps_polea',
    name: 'TRÍCEPS EN POLEA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'curl_martillo',
    name: 'CURL MARTILLO',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'extension_triceps',
    name: 'EXTENSIÓN DE TRÍCEPS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'saque_tras_nuca',
    name: 'SAQUE TRAS LA NUCA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  Exercise(
    id: 'sentadilla_libre',
    name: 'SENTADILLA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'sentadilla_carga',
    name: 'SENTADILLA + CARGA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'prensa_piernas',
    name: 'PRENSA DE PIERNAS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // CORE
  // --------------------------------------------------

  Exercise(
    id: 'plancha_frontal',
    name: 'PLANCHA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 1,
        unit: 'min',
      ),
    ],
  ),

  Exercise(
    id: 'crunches',
    name: 'CRUNCHES',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'elevaciones_piernas',
    name: 'ELEVACIONES DE PIERNAS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 20,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // BACK
  // --------------------------------------------------

  Exercise(
    id: 'polea_pecho',
    name: 'POLEA AL PECHO',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'remo_sentado',
    name: 'REMO SENTADO',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'remo_barra',
    name: 'REMO CON BARRA',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),

      ExerciseVariant(
        index: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),
];
