import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';

class PlayerStorage {
  static const String _playerKey = 'player';

  // --------------------------------------------------
  // SAVE
  // --------------------------------------------------

  Future<void> savePlayer(Player player) async {
    final preferences =
        await SharedPreferences.getInstance();

    final playerData = {
      'name': player.name,
      'playerClass': player.playerClass.name,
      'stats': {
        'strength': player.stats.strength,
        'endurance': player.stats.endurance,
        'energy': player.stats.energy,
        'stamina': player.stats.stamina,
      },
    };

    final json = jsonEncode(playerData);

    await preferences.setString(
      _playerKey,
      json,
    );
  }

  // --------------------------------------------------
  // LOAD
  // --------------------------------------------------

  Future<Player?> loadPlayer() async {
    final preferences =
        await SharedPreferences.getInstance();

    final json =
        preferences.getString(_playerKey);

    if (json == null) {
      return null;
    }

    final Map<String, dynamic> playerData =
        jsonDecode(json);

    final statsData =
        playerData['stats'] as Map<String, dynamic>;

    final stats = PlayerStats(
      strength: statsData['strength'] as int,
      endurance: statsData['endurance'] as int,
      energy: statsData['energy'] as int,
      stamina: statsData['stamina'] as int,
    );

    final playerClass =
        PlayerClass.values.firstWhere(
      (value) =>
          value.name == playerData['playerClass'],
    );

    return Player(
      name: playerData['name'] as String,
      playerClass: playerClass,
      stats: stats,
    );
  }
}