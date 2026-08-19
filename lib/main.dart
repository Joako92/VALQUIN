import 'package:flutter/material.dart';

import 'app.dart';
import 'managers/player_manager.dart';
import 'persistence/player_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final playerStorage = PlayerStorage();

  final playerManager = PlayerManager(
    storage: playerStorage,
  );

  await playerManager.loadPlayer();

  runApp(
    SoloTrainingApp(
      playerManager: playerManager,
    ),
  );
}