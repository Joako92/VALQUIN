import 'package:flutter_test/flutter_test.dart';

import 'package:solo_training_001/models/player.dart';

void main() {
  // --------------------------------------------------
  // HELPERS
  // --------------------------------------------------

  Player createPlayer({
    String name = 'Test Player',
    PlayerClass playerClass = PlayerClass.novice,
    int strength = 0,
    int endurance = 0,
    int energy = 0,
    int stamina = 0,
  }) {
    return Player(
      name: name,
      playerClass: playerClass,
      stats: PlayerStats(
        strength: strength,
        endurance: endurance,
        energy: energy,
        stamina: stamina,
      ),
    );
  }

  // --------------------------------------------------
  // PLAYER
  // --------------------------------------------------

  group('Player', () {
    test(
      'creates a player with the provided name and class',
      () {
        final player = createPlayer(
          name: 'Arthur',
          playerClass: PlayerClass.novice,
        );

        expect(player.name, 'Arthur');
        expect(player.playerClass, PlayerClass.novice);
      },
    );
  });

  // --------------------------------------------------
  // XP
  // --------------------------------------------------

  group('XP', () {
    test(
      'XP is equal to the total stats',
      () {
        final player = createPlayer(
          strength: 100,
          endurance: 50,
          energy: 25,
          stamina: 25,
        );

        expect(player.xp, 200);
      },
    );
  });

  // --------------------------------------------------
  // LEVEL
  // --------------------------------------------------

  group('Level', () {
    test(
      'starts at level 1 with zero XP',
      () {
        final player = createPlayer();

        expect(player.level, 1);
      },
    );

    test(
      'reaches level 5 at 400 XP',
      () {
        final player = createPlayer(
          strength: 400,
        );

        expect(player.level, 5);
      },
    );

    test(
      'reaches level 6 at 500 XP',
      () {
        final player = createPlayer(
          strength: 500,
        );

        expect(player.level, 6);
      },
    );
  });

  // --------------------------------------------------
  // XP FOR CURRENT LEVEL
  // --------------------------------------------------

  group('xpForCurrentLevel', () {
    test(
      'returns XP accumulated inside current level',
      () {
        final player = createPlayer(
          strength: 450,
        );

        expect(player.xpForCurrentLevel, 50);
      },
    );

    test(
      'returns zero at the beginning of a level',
      () {
        final player = createPlayer(
          strength: 500,
        );

        expect(player.xpForCurrentLevel, 0);
      },
    );
  });

  // --------------------------------------------------
  // STATS
  // --------------------------------------------------

  group('Stats', () {
    test(
      'returns the requested stat',
      () {
        final player = createPlayer(
          strength: 100,
          endurance: 200,
          energy: 300,
          stamina: 400,
        );

        expect(player.getStat('strength'), 100);
        expect(player.getStat('endurance'), 200);
        expect(player.getStat('energy'), 300);
        expect(player.getStat('stamina'), 400);
      },
    );

    test(
      'adds stats correctly',
      () {
        final player = createPlayer(
          strength: 100,
          endurance: 100,
          energy: 100,
          stamina: 100,
        );

        player.addStats({
          'strength': 25,
          'endurance': 50,
          'energy': 75,
          'stamina': 100,
        });

        expect(player.getStat('strength'), 125);
        expect(player.getStat('endurance'), 150);
        expect(player.getStat('energy'), 175);
        expect(player.getStat('stamina'), 200);
      },
    );

    test(
      'XP updates when stats increase',
      () {
        final player = createPlayer(
          strength: 100,
          endurance: 100,
        );

        expect(player.xp, 200);

        player.addStats({
          'strength': 50,
          'stamina': 50,
        });

        expect(player.xp, 300);
      },
    );
  });

  // --------------------------------------------------
  // CLASS
  // --------------------------------------------------

  group('Class', () {
    test(
      'new player starts with Novice class',
      () {
        final player = createPlayer();

        expect(
          player.playerClass,
          PlayerClass.novice,
        );
      },
    );

    test(
      'changeClass changes the player class',
      () {
        final player = createPlayer();

        player.changeClass(
          PlayerClass.runner,
        );

        expect(
          player.playerClass,
          PlayerClass.runner,
        );
      },
    );

    test(
      'can change from a specialized class to Athlete',
      () {
        final player = createPlayer(
          playerClass: PlayerClass.runner,
        );

        player.changeClass(
          PlayerClass.athlete,
        );

        expect(
          player.playerClass,
          PlayerClass.athlete,
        );
      },
    );

    test(
      'changing class does not modify player stats',
      () {
        final player = createPlayer(
          strength: 150,
          endurance: 125,
          energy: 100,
          stamina: 200,
        );

        player.changeClass(
          PlayerClass.powerLifter,
        );

        expect(player.getStat('strength'), 150);
        expect(player.getStat('endurance'), 125);
        expect(player.getStat('energy'), 100);
        expect(player.getStat('stamina'), 200);
      },
    );
  });
}
