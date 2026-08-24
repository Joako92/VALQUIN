import '../models/exercise.dart';

const List<Exercise> exercises = [
  // --------------------------------------------------
  // CARDIO
  // --------------------------------------------------

  Exercise(
    id: 'trote',
    name: 'TROTE',
    variants: [
      ExerciseVariant(
        index: 0,
        amount: 5,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 1,
        amount: 10,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 2,
        amount: 15,
        unit: 'km',
      ),
      ExerciseVariant(
        index: 3,
        amount: 30,
        unit: 'min',
      ),
      ExerciseVariant(
        index: 4,
        amount: 60,
        unit: 'min',
      ),
    ],
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  Exercise(
    id: 'bench_press',
    name: 'BENCH PRESS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 5,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 1,
        sets: 3,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 2,
        sets: 4,
        amount: 10,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 3,
        sets: 4,
        amount: 15,
        unit: 'reps',
      ),
      ExerciseVariant(
        index: 4,
        sets: 5,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  Exercise(
    id: 'apertura_mancuernas',
    name: 'APERTURA CON MANCUERNAS',
    variants: [
      ExerciseVariant(
        index: 0,
        sets: 3,
        amount: 12,
        unit: 'reps',
      ),
    ],
  ),

  // --------------------------------------------------
  // TEST
  // --------------------------------------------------

  Exercise(
    id: 'carameloraro',
    name: 'CARAMELORRARO',
    variants: [
      ExerciseVariant(
        index: 0,
        amount: 1,
        unit: 'unidad',
      ),
    ],
  ),
];