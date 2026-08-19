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
      return;
    }
  }

  // -------------------------------------------------- 
  // CREATE 
  // -------------------------------------------------- 
  Future<void> createPlayer({ 
    required String name, 
    required PlayerClass playerClass, 
  }) async { 
    final newPlayer = Player( 
      name: name, 
      playerClass: playerClass, 
      stats: PlayerStats(), 
    ); 
      
    _player = newPlayer; 
    
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