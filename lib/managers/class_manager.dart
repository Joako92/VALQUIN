import '../models/player.dart';

class ClassManager {
  // --------------------------------------------------
  // REQUIREMENTS
  // --------------------------------------------------

  static const int minimumLevel = 5;
  static const int minimumStat = 100;

  // --------------------------------------------------
  // CLASS CHANGE
  // --------------------------------------------------

  bool canChangeClass(Player player) {
    return availableClasses(player).isNotEmpty;
  }

  // --------------------------------------------------
  // AVAILABLE CLASSES
  // --------------------------------------------------

  List<PlayerClass> availableClasses(Player player) {
    final available = <PlayerClass>[];

    // No class change is available before level 5.
    if (player.level < minimumLevel) {
      return available;
    }

    // --------------------------------------------------
    // SPECIALIZED CLASSES
    // --------------------------------------------------

    if (player.playerClass == PlayerClass.novice) {
      if (player.getStat('strength') >= minimumStat) {
        available.add(PlayerClass.powerLifter);
      }

      if (player.getStat('endurance') >= minimumStat) {
        available.add(PlayerClass.bodybuilder);
      }

      if (player.getStat('energy') >= minimumStat) {
        available.add(PlayerClass.gymnast);
      }

      if (player.getStat('stamina') >= minimumStat) {
        available.add(PlayerClass.runner);
      }
    }

    // --------------------------------------------------
    // ATHLETE
    // --------------------------------------------------

    if (player.playerClass != PlayerClass.athlete &&
        _canBecomeAthlete(player)) {
      available.add(PlayerClass.athlete);
    }

    return available;
  }

  // --------------------------------------------------
  // ATHLETE
  // --------------------------------------------------

  bool _canBecomeAthlete(Player player) {
    return player.getStat('strength') >= minimumStat &&
        player.getStat('endurance') >= minimumStat &&
        player.getStat('energy') >= minimumStat &&
        player.getStat('stamina') >= minimumStat;
  }
}