class TrainingRecordExercise {
  final int? id;

  final int trainingRecordId;

  final String exerciseId;

  final int variantIndex;

  final int? sets;
  final double amount;
  final String unit;

  const TrainingRecordExercise({
    this.id,
    required this.trainingRecordId,
    required this.exerciseId,
    required this.variantIndex,
    this.sets,
    required this.amount,
    required this.unit,
  });

  String get description {
    if (sets != null) {
      return '$sets × ${amount.toInt()} $unit';
    }

    return '${amount.toInt()} $unit';
  }
}