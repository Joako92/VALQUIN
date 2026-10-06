import '../../data/exercise_variants.dart';
import '../app_database.dart';

class VariantFamilySeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final family in variantFamilies) {
      await database.replaceVariantFamily(
        family: family,
      );
    }
  }
}
