import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'config/app_settings.dart';

import 'database/app_database.dart';

import 'managers/player_manager.dart';
import 'managers/training_plan_manager.dart';
import 'managers/class_manager.dart';

import 'screens/create_player_screen.dart';
import 'screens/main_screen.dart';

class SoloTrainingApp extends StatelessWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;
  final AppSettings settings;

  const SoloTrainingApp({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    final hasPlayer = playerManager.player != null;

    return ListenableBuilder(
      listenable: settings,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.dark(
              primary: settings.accentColor,
              secondary: settings.accentColor,
            ),
          ),

          home: hasPlayer
              ? MainScreen(
                  playerManager: playerManager,
                  trainingPlanManager: trainingPlanManager,
                  classManager: classManager,
                  database: database,
                  settings: settings,
                )
              : CreatePlayerScreen(
                  playerManager: playerManager,
                  trainingPlanManager: trainingPlanManager,
                  classManager: classManager,
                  database: database,
                  settings: settings,
                ),
        );
      },
    );
  }
}