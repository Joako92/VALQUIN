import '../app_database.dart';
import 'exercise_seeder.dart';
import 'equipment_item_seeder.dart';

class DatabaseSeeder {
  static Future<void> seedIfNeeded(
    AppDatabase database,
  ) async {
    final exercises = await database.getExercisesWithVariants();

    if (exercises.isNotEmpty) {
      return;
    }

    await ExerciseSeeder.seed(database);
    await EquipmentItemSeeder.seed(database);
  }
}
