import 'player_class.dart';

class Requirement {
  final int? level;
  final Map<String, int> stats;
  final Set<PlayerClass> classes;

  const Requirement({
    this.level,
    this.stats = const {},
    this.classes = const {},
  });
}