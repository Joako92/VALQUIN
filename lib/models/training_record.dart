import 'training_record_exercise.dart';

class TrainingRecord {
  final int? id;

  final DateTime completedAt;

  final int strengthGained;
  final int enduranceGained;
  final int energyGained;
  final int staminaGained;

  final List<TrainingRecordExercise> exercises;

  const TrainingRecord({
    this.id,
    required this.completedAt,
    this.strengthGained = 0,
    this.enduranceGained = 0,
    this.energyGained = 0,
    this.staminaGained = 0,
    this.exercises = const [],
  });

  int get xpGained {
    return strengthGained +
        enduranceGained +
        energyGained +
        staminaGained;
  }
}