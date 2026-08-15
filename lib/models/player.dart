enum PlayerClass {
  novice,
  powerLifter,
  runner,
  bodybuilder,
  athlete,
}

class PlayerStats {
  final int strength;
  final int endurance;
  final int energy;
  final int stamina;

  const PlayerStats({
    required this.strength,
    required this.endurance,
    required this.energy,
    required this.stamina,
  });
}

class Player {
  final String name;
  final int level;
  final int xp;
  final PlayerClass playerClass;
  final PlayerStats stats;

  const Player({
    required this.name,
    required this.level,
    required this.xp,
    required this.playerClass,
    required this.stats,
  });
}