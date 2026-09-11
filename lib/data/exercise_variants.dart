import '../models/exercise.dart';

/// Common strength training variants.
const List<ExerciseVariant> standardStrengthVariants = [
  ExerciseVariant(
    index: 0,
    sets: 3,
    amount: 10,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 1,
    sets: 4,
    amount: 10,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 2,
    sets: 4,
    amount: 12,
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
];

/// Common running training variants.
const List<ExerciseVariant> runningVariants = [
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
  ExerciseVariant(
    index: 2,
    amount: 3,
    unit: 'km',
  ),
  ExerciseVariant(
    index: 3,
    amount: 5,
    unit: 'km',
  ),
  ExerciseVariant(
    index: 4,
    amount: 10,
    unit: 'km',
  ),
];

/// Common cardio training variants.
const List<ExerciseVariant> cardioVariants = [
  ExerciseVariant(
    index: 0,
    sets: 3,
    amount: 30,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 1,
    sets: 4,
    amount: 40,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 2,
    sets: 4,
    amount: 50,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 3,
    sets: 4,
    amount: 100,
    unit: 'reps',
  ),
  ExerciseVariant(
    index: 4,
    sets: 4,
    amount: 200,
    unit: 'reps',
  ),
];

/// Common timed training variants.
const List<ExerciseVariant> timedVariants = [
  ExerciseVariant(
    index: 0,
    sets: 3,
    amount: 0.5,
    unit: 'min',
  ),
  ExerciseVariant(
    index: 1,
    sets: 4,
    amount: 1,
    unit: 'min',
  ),
  ExerciseVariant(
    index: 2,
    sets: 4,
    amount: 2,
    unit: 'min',
  ),
  ExerciseVariant(
    index: 3,
    sets: 4,
    amount: 3,
    unit: 'min',
  ),
  ExerciseVariant(
    index: 4,
    sets: 4,
    amount: 5,
    unit: 'min',
  ),
];

/// Common cycling training variants.
const List<ExerciseVariant> bikeVariants = [
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
  ExerciseVariant(
    index: 2,
    amount: 10,
    unit: 'km',
  ),
  ExerciseVariant(
    index: 3,
    amount: 20,
    unit: 'km',
  ),
  ExerciseVariant(
    index: 4,
    amount: 30,
    unit: 'km',
  ),
];

/// sprint training variants.
const List<ExerciseVariant> sprintVariants = [
  ExerciseVariant(
    index: 0,
    sets: 3,
    amount: 100,
    unit: 'm',
  ),
  ExerciseVariant(
    index: 1,
    sets: 4,
    amount: 100,
    unit: 'm',
  ),
  ExerciseVariant(
    index: 2,
    sets: 5,
    amount: 100,
    unit: 'm',
  ),
  ExerciseVariant(
    index: 3,
    sets: 4,
    amount: 200,
    unit: 'm',
  ),
  ExerciseVariant(
    index: 4,
    sets: 6,
    amount: 200,
    unit: 'm',
  ),
];