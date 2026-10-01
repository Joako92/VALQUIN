import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'config/app_settings.dart';
import 'config/app_theme.dart';

import 'database/app_database.dart';

import 'managers/player_manager.dart';
import 'managers/training_plan_manager.dart';
import 'managers/class_manager.dart';
import 'managers/training_history_manager.dart';

import 'screens/main_screen.dart';
import 'screens/welcome_screen.dart';

class SoloTrainingApp extends StatelessWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final TrainingHistoryManager trainingHistoryManager;
  final AppDatabase database;
  final AppSettings settings;

  const SoloTrainingApp({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.trainingHistoryManager,
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
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(
              primary: settings.accentColor,
              secondary: settings.accentColor,
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.dark(
              primary: settings.accentColor,
              secondary: settings.accentColor,
            ),
          ),

          themeMode: settings.theme == AppTheme.light
              ? ThemeMode.light
              : ThemeMode.dark,

          home: hasPlayer
              ? MainScreen(
                  playerManager: playerManager,
                  trainingPlanManager: trainingPlanManager,
                  classManager: classManager,
                  trainingHistoryManager: trainingHistoryManager,
                  database: database,
                  settings: settings,
                )
              : WelcomeScreen(
                  playerManager: playerManager,
                  trainingPlanManager: trainingPlanManager,
                  classManager: classManager,
                  trainingHistoryManager: trainingHistoryManager,
                  database: database,
                  settings: settings,
                ),
        );
      },
    );
  }
}