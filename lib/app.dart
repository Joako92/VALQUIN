import 'package:flutter/material.dart';

import 'managers/player_manager.dart';
import 'managers/training_plan_manager.dart';
import 'screens/create_player_screen.dart';
import 'screens/main_screen.dart';

class SoloTrainingApp extends StatelessWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;

  const SoloTrainingApp({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
  });

  @override
  Widget build(BuildContext context) {
    final hasPlayer = playerManager.player != null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B12),
      ),

      home: hasPlayer
          ? MainScreen(
              playerManager: playerManager,
              trainingPlanManager: trainingPlanManager,
            )
          : CreatePlayerScreen(
              playerManager: playerManager,
              trainingPlanManager: trainingPlanManager,
            ),
    );
  }
}