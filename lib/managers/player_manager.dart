import '../models/player.dart';
import '../persistence/player_storage.dart';

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
    }
  }

  // --------------------------------------------------
  // CREATE
  // --------------------------------------------------

  Future<void> createPlayer({
    required String name,
  }) async {
    final newPlayer = Player(
      name: name,
      playerClass: PlayerClass.novice,
      stats: PlayerStats(),
    );

    _player = newPlayer;

    await savePlayer();
  }

  // --------------------------------------------------
  // CHANGE CLASS
  // --------------------------------------------------

  Future<void> changeClass(
    PlayerClass newClass,
  ) async {
    if (_player == null) {
      return;
    }

    _player!.changeClass(newClass);

    await savePlayer();
  }

  // --------------------------------------------------
  // RESET PLAYER
  // --------------------------------------------------

  Future<void> resetPlayer() async {
    if (_player == null) {
      return;
    }

    final playerName = _player!.name;

    _player = Player(
      name: playerName,
      playerClass: PlayerClass.novice,
      stats: PlayerStats(),
    );

    await savePlayer();
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