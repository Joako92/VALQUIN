import '../app_database.dart';
import 'variant_family_seeder.dart';
import 'exercise_seeder.dart';
import 'equipment_item_seeder.dart';

class DatabaseSeeder {
  static Future<void> seed(
    AppDatabase database,
  ) async {
    await VariantFamilySeeder.seed(database);
    await ExerciseSeeder.seed(database);
    await EquipmentItemSeeder.seed(database);
  }
}
