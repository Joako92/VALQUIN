import 'package:flutter/material.dart';

import 'app.dart';

import 'data/training_plan.dart';

import 'database/app_database.dart';
// import 'database/seed/database_seeder.dart';
// import 'package:solo_training_001/database/admin/database_admin.dart';

import 'managers/player_manager.dart';
import 'managers/training_plan_manager.dart';
import 'managers/class_manager.dart';

import 'persistence/player_storage.dart';
import 'persistence/training_plan_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------
  // DATABASE
  // --------------------------------------------------

  final database = AppDatabase();

  // Fill database from seeder
  // await DatabaseSeeder.seed(database);

  // --------------------------------------------------
  // DATABASE CLEANUP
  // --------------------------------------------------

  // Exercises to remove

  // await database.deleteExerciseCompletely(
  //   'carameloraro',
  // );

  // // Equipment items to remove

  // await database.deleteEquipmentItemCompletely(
  //   'casco_mejorado',
  // );

  // await DatabaseAdmin.printExercises(database);
  // await DatabaseAdmin.debugEquipmentDatabase(database);
  // await DatabaseAdmin.debugExerciseDatabase(database);

  // --------------------------------------------------
  // PLAYER
  // --------------------------------------------------

  final playerStorage = PlayerStorage();

  final playerManager = PlayerManager(
    storage: playerStorage,
  );

  await playerManager.loadPlayer();

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
    ),
  );
}
