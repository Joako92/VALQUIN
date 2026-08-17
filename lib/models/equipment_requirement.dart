class EquipmentRequirement {
  final int? level;
  final Map<String, int> stats;

  const EquipmentRequirement({
    this.level,
    this.stats = const {},
  });
}