import 'package:flutter_test/flutter_test.dart';

import 'package:solo_training_001/managers/class_manager.dart';
import 'package:solo_training_001/models/player.dart';

void main() {
  late ClassManager classManager;

  setUp(() {
    classManager = ClassManager();
  });

  // --------------------------------------------------
  // HELPERS
  // --------------------------------------------------

  Player createPlayer({
    int level = 5,
    int strength = 0,
    int endurance = 0,
    int energy = 0,
    int stamina = 0,
    PlayerClass playerClass = PlayerClass.novice,
  }) {
    final totalXp = (level - 1) * 100;

    final currentStatsTotal =
        strength +
        endurance +
        energy +
        stamina;

    final remainingXp =
        totalXp - currentStatsTotal;

    return Player(
      name: 'Test Player',
      playerClass: playerClass,
      stats: PlayerStats(
        strength: strength,
        endurance: endurance,
        energy: energy,
        stamina: stamina + remainingXp,
      ),
    );
  }

  // --------------------------------------------------
  // CAN CHANGE CLASS
  // --------------------------------------------------

  group('canChangeClass', () {
    test(
      'cannot change class before level 5',
      () {
        final player = createPlayer(
          level: 4,
        );

        expect(
          classManager.canChangeClass(player),
          isFalse,
        );
      },
    );

    test(
      'can change class at level 5 when player is Novice',
      () {
        final player = createPlayer(
          level: 5,
          stamina: 100,
        );

        expect(
          classManager.canChangeClass(player),
          isTrue,
        );
      },
    );

    test(
      'cannot change class when specialized player has not unlocked Athlete',
      () {
        final player = createPlayer(
          level: 5,
          playerClass: PlayerClass.runner,
        );

        expect(
          classManager.canChangeClass(player),
          isFalse,
        );
      },
    );

    test(
      'can change class from specialized class to Athlete',
      () {
        final player = createPlayer(
          level: 5,
          playerClass: PlayerClass.runner,
          strength: 100,
          endurance: 100,
          energy: 100,
          stamina: 150,
        );

        expect(
          classManager.canChangeClass(player),
          isTrue,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.athlete),
        );
      },
    );
  });

  // --------------------------------------------------
  // SPECIALIZED CLASSES
  // --------------------------------------------------

  group('available specialized classes', () {
    test(
      'unlocks Power Lifter at 100 Strength',
      () {
        final player = createPlayer(
          strength: 100,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.powerLifter),
        );
      },
    );

    test(
      'does not unlock Power Lifter below 100 Strength',
      () {
        final player = createPlayer(
          strength: 99,
        );

        expect(
          classManager.availableClasses(player),
          isNot(contains(PlayerClass.powerLifter)),
        );
      },
    );

    test(
      'unlocks Bodybuilder at 100 Endurance',
      () {
        final player = createPlayer(
          endurance: 100,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.bodybuilder),
        );
      },
    );

    test(
      'unlocks Gymnast at 100 Energy',
      () {
        final player = createPlayer(
          energy: 100,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.gymnast),
        );
      },
    );

    test(
      'unlocks Runner at 100 Stamina',
      () {
        final player = createPlayer(
          stamina: 100,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.runner),
        );
      },
    );
  });

  // --------------------------------------------------
  // LEVEL REQUIREMENT
  // --------------------------------------------------

  test(
    'no class is available before level 5',
    () {
      final player = createPlayer(
        level: 4,
        strength: 200,
        endurance: 200,
        energy: 200,
        stamina: 200,
      );

      expect(
        classManager.availableClasses(player),
        isEmpty,
      );
    },
  );

  // --------------------------------------------------
  // MULTIPLE CLASSES
  // --------------------------------------------------

  test(
    'multiple specialized classes can be available at once',
    () {
      final player = createPlayer(
        strength: 120,
        endurance: 150,
        stamina: 200,
      );

      final available =
          classManager.availableClasses(player);

      expect(
        available,
        containsAll([
          PlayerClass.powerLifter,
          PlayerClass.bodybuilder,
          PlayerClass.runner,
        ]),
      );

      expect(
        available,
        isNot(contains(PlayerClass.gymnast)),
      );
    },
  );

  // --------------------------------------------------
  // ATHLETE
  // --------------------------------------------------

  group('Athlete', () {
    test(
      'unlocks Athlete when every stat reaches 100',
      () {
        final player = createPlayer(
          strength: 100,
          endurance: 100,
          energy: 100,
          stamina: 100,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.athlete),
        );
      },
    );

    test(
      'does not unlock Athlete when one stat is below 100',
      () {
        final player = createPlayer(
          strength: 101,
          endurance: 100,
          energy: 100,
          stamina: 99,
        );

        expect(
          classManager.availableClasses(player),
          isNot(contains(PlayerClass.athlete)),
        );
      },
    );

    test(
      'Athlete becomes available after choosing a specialized class',
      () {
        final player = createPlayer(
          playerClass: PlayerClass.runner,
          strength: 100,
          endurance: 100,
          energy: 100,
          stamina: 150,
        );

        expect(
          player.playerClass,
          PlayerClass.runner,
        );

        expect(
          classManager.canChangeClass(player),
          isTrue,
        );

        expect(
          classManager.availableClasses(player),
          contains(PlayerClass.athlete),
        );
      },
    );

    test(
      'Athlete is not available when a specialized player is missing one stat',
      () {
        final player = createPlayer(
          playerClass: PlayerClass.runner,
          strength: 101,
          endurance: 100,
          energy: 100,
          stamina: 99,
        );

        expect(
          classManager.availableClasses(player),
          isNot(contains(PlayerClass.athlete)),
        );

        expect(
          classManager.canChangeClass(player),
          isFalse,
        );
      },
    );

    test(
      'Athlete cannot be selected again after becoming Athlete',
      () {
        final player = createPlayer(
          playerClass: PlayerClass.athlete,
          strength: 150,
          endurance: 150,
          energy: 150,
          stamina: 150,
        );

        expect(
          classManager.availableClasses(player),
          isEmpty,
        );

        expect(
          classManager.canChangeClass(player),
          isFalse,
        );
      },
    );
  });

  // --------------------------------------------------
  // CLASS CHANGE IS NOT AUTOMATIC
  // --------------------------------------------------

  test(
    'available classes do not change the player class',
    () {
      final player = createPlayer(
        strength: 150,
      );

      classManager.availableClasses(player);

      expect(
        player.playerClass,
        PlayerClass.novice,
      );
    },
  );
}
