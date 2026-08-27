import 'package:flutter_test/flutter_test.dart';

import 'package:solo_training_001/managers/player_manager.dart';
import 'package:solo_training_001/models/player.dart';
import 'package:solo_training_001/persistence/player_storage.dart';

class FakePlayerStorage extends PlayerStorage {
  Player? savedPlayer;

  @override
  Future<void> savePlayer(Player player) async {
    savedPlayer = player;
  }

  @override
  Future<Player?> loadPlayer() async {
    return savedPlayer;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------
  // HELPERS
  // --------------------------------------------------

  group('PlayerManager', () {
    late FakePlayerStorage storage;
    late PlayerManager playerManager;

    setUp(() {
      storage = FakePlayerStorage();

      playerManager = PlayerManager(
        storage: storage,
      );
    });

    // --------------------------------------------------
    // CREATE PLAYER
    // --------------------------------------------------

    group('createPlayer', () {
      test(
        'creates a new player as Novice',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          expect(
            playerManager.player,
            isNotNull,
          );

          expect(
            playerManager.player!.name,
            'Test Player',
          );

          expect(
            playerManager.player!.playerClass,
            PlayerClass.novice,
          );
        },
      );
    });

    // --------------------------------------------------
    // CHANGE CLASS
    // --------------------------------------------------

    group('changeClass', () {
      test(
        'changes class from Novice to Runner',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          expect(
            playerManager.player!.playerClass,
            PlayerClass.runner,
          );
        },
      );

      test(
        'changes class from Novice to Power Lifter',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.powerLifter,
          );

          expect(
            playerManager.player!.playerClass,
            PlayerClass.powerLifter,
          );
        },
      );

      test(
        'does nothing when there is no player',
        () async {
          expect(
            playerManager.player,
            isNull,
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          expect(
            playerManager.player,
            isNull,
          );
        },
      );
    });

    // --------------------------------------------------
    // CHANGE CLASS PERSISTENCE
    // --------------------------------------------------

    group('changeClass persistence', () {
      test(
        'persists the new class',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          expect(
            storage.savedPlayer!.playerClass,
            PlayerClass.runner,
          );
        },
      );
    });

    // --------------------------------------------------
    // RESET PLAYER
    // --------------------------------------------------

    group('resetPlayer', () {
      test(
        'resets player to Novice',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          await playerManager.resetPlayer();

          expect(
            playerManager.player!.playerClass,
            PlayerClass.novice,
          );
        },
      );

      test(
        'preserves player name',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          await playerManager.resetPlayer();

          expect(
            playerManager.player!.name,
            'Test Player',
          );
        },
      );

      test(
        'resets player stats',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          // Modify the player's stats.
          playerManager.player!.stats.strength = 100;
          playerManager.player!.stats.endurance = 100;
          playerManager.player!.stats.energy = 100;
          playerManager.player!.stats.stamina = 100;

          await playerManager.resetPlayer();

          expect(
            playerManager.player!.stats.strength,
            0,
          );

          expect(
            playerManager.player!.stats.endurance,
            0,
          );

          expect(
            playerManager.player!.stats.energy,
            0,
          );

          expect(
            playerManager.player!.stats.stamina,
            0,
          );
        },
      );

      test(
        'resets level and XP through stats',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          playerManager.player!.stats.strength = 100;
          playerManager.player!.stats.endurance = 100;
          playerManager.player!.stats.energy = 100;
          playerManager.player!.stats.stamina = 100;

          expect(
            playerManager.player!.xp,
            400,
          );

          expect(
            playerManager.player!.level,
            5,
          );

          await playerManager.resetPlayer();

          expect(
            playerManager.player!.xp,
            0,
          );

          expect(
            playerManager.player!.level,
            1,
          );

          expect(
            playerManager.player!.xpForCurrentLevel,
            0,
          );

          expect(
            playerManager.player!.xpRequiredForLevel,
            100,
          );
        },
      );

      test(
        'persists the reset player',
        () async {
          await playerManager.createPlayer(
            name: 'Test Player',
          );

          await playerManager.changeClass(
            PlayerClass.runner,
          );

          await playerManager.resetPlayer();

          expect(
            storage.savedPlayer,
            isNotNull,
          );

          expect(
            storage.savedPlayer!.name,
            'Test Player',
          );

          expect(
            storage.savedPlayer!.playerClass,
            PlayerClass.novice,
          );
        },
      );

      test(
        'does nothing when there is no player',
        () async {
          expect(
            playerManager.player,
            isNull,
          );

          await playerManager.resetPlayer();

          expect(
            playerManager.player,
            isNull,
          );

          expect(
            storage.savedPlayer,
            isNull,
          );
        },
      );
    });
  });
}