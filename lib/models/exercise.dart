class ExerciseVariant {
  final int index;

  final int? sets;
  final double amount;
  final String unit;

  const ExerciseVariant({
    required this.index,
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

class Exercise {
  final String id;
  final String name;

  final List<ExerciseVariant> variants;

  final Map<String, int> stats;

  const Exercise({
    required this.id,
    required this.name,
    required this.variants,
    this.stats = const {},
  });

  ExerciseVariant getVariant(int index) {
    return variants.firstWhere(
      (variant) => variant.index == index,
    );
  }

  ExerciseVariant get baseVariant {
    return getVariant(0);
  }
}