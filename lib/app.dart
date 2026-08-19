import 'package:flutter/material.dart';

import 'managers/player_manager.dart';
import 'screens/main_screen.dart';

class SoloTrainingApp extends StatelessWidget {
  final PlayerManager playerManager;

  const SoloTrainingApp({
    super.key,
    required this.playerManager,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B12),
      ),

      home: MainScreen(
        playerManager: playerManager,
      ),
    );
  }
}