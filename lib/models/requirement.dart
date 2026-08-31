class Requirement {
  final int? level;
  final Map<String, int> stats;

  const Requirement({
    this.level,
    this.stats = const {},
  });
}