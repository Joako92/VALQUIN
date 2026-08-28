import '../models/exercise.dart';

const List<Exercise> exercises = [
  // --------------------------------------------------
  // CARDIO
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

  // --------------------------------------------------
  // ARMS
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
    ],
  ),

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
];