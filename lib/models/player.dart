import 'player_class.dart';
export 'player_class.dart';

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

  int getStat(String stat) {
    switch (stat) {
      case 'strength':
        return strength;

      case 'endurance':
        return endurance;

      case 'energy':
        return energy;

      case 'stamina':
        return stamina;

      default:
        return 0;
    }
  }

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
  final String avatarId;
  PlayerClass playerClass;

  final PlayerStats stats;

  Player({
    required this.name,
    required this.avatarId,
    required this.playerClass,
    required this.stats,
  });

  // --------------------------------------------------
  // PROGRESSION
  // --------------------------------------------------

  int get xp {
    return stats.total;
  }

  int get level {
    int level = 1;

    while (xp >= _xpRequiredForLevel(level + 1)) {
      level++;
    }

    return level;
  }

  int get xpForCurrentLevel { if (level == 1) { return xp; } return xp - _xpRequiredForLevel(level); }

  int get xpRequiredForLevel {
    return _xpRequiredForLevel(level + 1) -
        _xpRequiredForLevel(level);
  }

  int _xpRequiredForLevel(int level) {
    return 25 * level * (level + 1);
  }

  // --------------------------------------------------
  // STATS
  // --------------------------------------------------

  int getStat(String stat) {
    return stats.getStat(stat);
  }

  void addStats(Map<String, int> statsToAdd) {
    stats.addStats(statsToAdd);
  }

  // --------------------------------------------------
  // CLASS
  // --------------------------------------------------

  void changeClass(PlayerClass newClass) {
    playerClass = newClass;
  }
}