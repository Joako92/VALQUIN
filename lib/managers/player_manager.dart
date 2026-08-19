import '../models/player.dart';
import '../persistence/player_storage.dart';
import '../data/player.dart';

class PlayerManager {
  final PlayerStorage storage;

  Player? _player;

  PlayerManager({
    required this.storage,
  });

  // --------------------------------------------------
  // PLAYER
  // --------------------------------------------------

  Player? get player => _player;

  // --------------------------------------------------
  // LOAD
  // --------------------------------------------------

  Future<void> loadPlayer() async {
    final savedPlayer = await storage.loadPlayer();

    if (savedPlayer != null) {
      _player = savedPlayer;
      return;
    }

    _player = initialPlayer;
  }

  // --------------------------------------------------
  // SAVE
  // --------------------------------------------------

  Future<void> savePlayer() async {
    if (_player == null) {
      return;
    }

    await storage.savePlayer(_player!);
  }

  // --------------------------------------------------
  // SET PLAYER
  // --------------------------------------------------

  void setPlayer(Player player) {
    _player = player;
  }
}