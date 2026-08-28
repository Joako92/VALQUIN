import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:solo_training_001/database/app_database.dart';
import 'package:solo_training_001/database/seed/exercise_seeder.dart';
import 'package:solo_training_001/database/seed/equipment_item_seeder.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;

  setUp(() {
    database = AppDatabase(
      NativeDatabase.memory(),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test(
    'seeds equipment items successfully',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final items =
          await database.getEquipmentItemsWithAllData();

      expect(items, isNotEmpty);

      for (final item in items) {
        expect(item.id, isNotEmpty);
        expect(item.name, isNotEmpty);
      }
    },
  );
}