import '../app_database.dart';
import 'exercise_seeder.dart';
import 'equipment_item_seeder.dart';

class DatabaseSeeder {
  static Future<void> seed(
    AppDatabase database,
  ) async {
    await ExerciseSeeder.seed(database);
    await EquipmentItemSeeder.seed(database);
  }
}