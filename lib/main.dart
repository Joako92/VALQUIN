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

import 'persistence/app_settings_storage.dart';
import 'persistence/player_storage.dart';
import 'persistence/training_plan_storage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------
  // COMMAND LINE MODES
  // --------------------------------------------------

  final seederMode = args.contains('--seeder');
  final deleteMode = args.contains('--deletemode');
  final debugMode = args.contains('--debugmode');

  // --------------------------------------------------
  // DATABASE
  // --------------------------------------------------

  final database = AppDatabase();

  // Fill database from seeder
  final databaseNeedsSeed =
    !(await database.hasEquipmentItems());

  if (databaseNeedsSeed || seederMode) {
    await DatabaseSeeder.seed(database);
  }

  // --------------------------------------------------
  // DATABASE CLEANUP
  // --------------------------------------------------

  if (deleteMode) {
    
    // Example:
    
    // await database.deleteExerciseCompletely(
    //   'carameloraro',
    // );

    // await database.deleteEquipmentItemCompletely(
    //   'vincha_cuero',
    // );
  }

  // --------------------------------------------------
  // DATABASE DEBUG
  // --------------------------------------------------

  if (debugMode) {
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

  // await playerManager.loadPlayer();

  // // DEBUG ONLY
  // await playerManager.applyDebugStats(
  //   strength: 2500,
  //   endurance: 2500,
  //   energy: 2500,
  //   stamina: 2500,
  // );

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
  // APP
  // --------------------------------------------------

  runApp(
    SoloTrainingApp(
      playerManager: playerManager,
      trainingPlanManager: trainingPlanManager,
      classManager: classManager,
      database: database,
      settings: settings,
    ),
  );
}