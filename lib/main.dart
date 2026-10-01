import 'package:flutter/material.dart';
import 'package:valquin/config/app_settings.dart';

import 'app.dart';

import 'data/training_plan.dart';

import 'database/app_database.dart';
import 'database/seed/database_seeder.dart';
import 'package:valquin/database/admin/database_admin.dart';

import 'managers/player_manager.dart';
import 'managers/training_plan_manager.dart';
import 'managers/class_manager.dart';
import 'managers/training_history_manager.dart';

import 'persistence/app_settings_storage.dart';
import 'persistence/player_storage.dart';
import 'persistence/training_plan_storage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------
  // COMMAND LINE MODES flutter run --dart-define={MODE}=true
  // --------------------------------------------------

  const seederMode = bool.fromEnvironment('SEEDER');
  const deleteMode = bool.fromEnvironment('DELETE_MODE');
  const debugMode = bool.fromEnvironment('DEBUG_MODE');
  const debugPlayerMode = bool.fromEnvironment('DEBUG_PLAYER');

  // --------------------------------------------------
  // DATABASE
  // --------------------------------------------------

  final database = AppDatabase();

  // Fill database from seeder
  final databaseNeedsSeed =
    !(await database.hasEquipmentItems());

  if (databaseNeedsSeed || seederMode) {
    debugPrint('SEEDER ON');
    await DatabaseSeeder.seed(database);
  }

  // --------------------------------------------------
  // DATABASE CLEANUP
  // --------------------------------------------------

  if (deleteMode) {
    debugPrint('DELETE MODE ON');

    await database.deleteEquipmentItemsCompletely([
      'cinturon_reforzado',
      'faja_bronce',
      'gorra_cuero',
      'hombrera_hierro',
      'pantalones_cota',
      'visera_bronce',
      'pectoral_bronce',
      'pollera_bronce',
      'capucha_sabio',
      'tunica_sabio',
      'manto_sabio',
      'grebas_sabio',
      'coraza_atlas',
      'manto_campeon',
      'corona_atalanta',
    ]);

    debugPrint('Equipment cleanup completed.');
  }

  // --------------------------------------------------
  // DATABASE DEBUG
  // --------------------------------------------------

  if (debugMode) {
    debugPrint('DEBUG MODE ON');
    await DatabaseAdmin.printExercises(database);
    await DatabaseAdmin.debugEquipmentDatabase(database);
    await DatabaseAdmin.debugExerciseDatabase(database);
  }
  
  // --------------------------------------------------
  // APP SETTINGS
  // --------------------------------------------------

  final appSettingsStorage = AppSettingsStorage(
    database: database,
  );

  final settings = AppSettings(
    storage: appSettingsStorage,
  );

  await settings.load();

  // --------------------------------------------------
  // PLAYER
  // --------------------------------------------------

  final playerStorage = PlayerStorage();

  final playerManager = PlayerManager(
    storage: playerStorage,
  );

  await playerManager.loadPlayer();

  // --------------------------------------------------
  // EDIT PLAYER - DEBUG ONLY
  // --------------------------------------------------

  if (debugPlayerMode) {
    debugPrint('DEBUG PLAYER MODE ON');
    await playerManager.applyDebugStats(
      strength: 9999,
      endurance: 9999,
      energy: 9999,
      stamina: 9999,
    );
  }

  // --------------------------------------------------
  // TRAINING PLAN
  // --------------------------------------------------

  final trainingPlanStorage = TrainingPlanStorage();

  final trainingPlanManager = TrainingPlanManager(
    storage: trainingPlanStorage,
    trainingPlan: trainingPlan,
  );

  await trainingPlanManager.loadTrainingPlan();

  // --------------------------------------------------
  // CLASS
  // --------------------------------------------------

  final classManager = ClassManager();

  // --------------------------------------------------
  // TRAINING HISTORY
  // --------------------------------------------------

  final trainingHistoryManager = TrainingHistoryManager(
    database: database,
  );

  // --------------------------------------------------
  // APP
  // --------------------------------------------------

  runApp(
    SoloTrainingApp(
      playerManager: playerManager,
      trainingPlanManager: trainingPlanManager,
      classManager: classManager,
      trainingHistoryManager: trainingHistoryManager,
      database: database,
      settings: settings,
    ),
  );
}