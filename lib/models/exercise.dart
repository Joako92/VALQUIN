class Exercise {
  final String id;
  final String name;

  final int? sets;
  final double amount;
  final String unit;

  final Map<String, int> stats;

  const Exercise({
    required this.id,
    required this.name,
    this.sets,
    required this.amount,
    required this.unit,
    this.stats = const {},
  });

  String get description {
    if (sets != null) {
      return '$sets × ${amount.toInt()} $unit';
    }

    return '${amount.toInt()} $unit';
  }
}