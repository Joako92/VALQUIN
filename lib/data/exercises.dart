import '../models/exercise.dart';

const List<Exercise> exercises = [
  Exercise(
    id: 'trote_5km',
    name: 'TROTE',
    amount: 5,
    unit: 'km',
    stats: {
      'stamina': 2,
    },
  ),

  Exercise(
    id: 'press_banca_4x10',
    name: 'PRESS BANCA',
    sets: 4,
    amount: 10,
    unit: 'reps',
    stats: {
      'strength': 3,
    },
  ),

  Exercise(
    id: 'trote_30min',
    name: 'TROTE',
    amount: 30,
    unit: 'min',
    stats: {
      'stamina': 3,
    },
  ),

  Exercise(
    id: 'apertura_mancuernas_3x12',
    name: 'APERTURA CON MANCUERNAS',
    sets: 3,
    amount: 12,
    unit: 'reps',
    stats: {
      'strength': 1,
    },
  ),
];