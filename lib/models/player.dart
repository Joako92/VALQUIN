enum PlayerClass {
  novice,
  powerLifter,
  runner,
  bodybuilder,
  athlete,
}

class PlayerStats {
  int strength;
  int endurance;
  int energy;
  int stamina;

  PlayerStats({
    this.strength = 0,
    this.endurance = 0,
    this.energy = 0,
    this.stamina = 0,
  });

  void addStats(Map<String, int> stats) {
    strength += stats['strength'] ?? 0;
    endurance += stats['endurance'] ?? 0;
    energy += stats['energy'] ?? 0;
    stamina += stats['stamina'] ?? 0;
  }

  int get total {
    return strength +
        endurance +
        energy +
        stamina;
  }
}

class Player {
  final String name;
  final PlayerClass playerClass;

  final PlayerStats stats;

  Player({
    required this.name,
    required this.playerClass,
    required this.stats,
  });

  int get xp {
    return stats.total;
  }

  int get level {
    return (xp ~/ 100) + 1;
  }

  int get xpForCurrentLevel {
    return xp % 100;
  }

  int get xpRequiredForLevel {
    return 100;
  }

  void addStats(Map<String, int> statsToAdd) {
    stats.addStats(statsToAdd);
  }
}