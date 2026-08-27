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
    'seeds equipment items with all related data',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final items =
          await database.getEquipmentItemsWithAllData();

      expect(items.length, 5);

      final casco =
          items.firstWhere(
        (item) => item.id == 'casco_novato',
      );

      expect(casco.name, 'CASCO DEL NOVATO');
      expect(casco.rarity.name, 'common');
      expect(casco.slot.name, 'head');
      expect(casco.cooldownHours, 24);

      expect(casco.stats['stamina'], 2);

      expect(
        casco.exercises.length,
        1,
      );

      expect(
        casco.exercises.first.exercise.id,
        'trote',
      );

      expect(
        casco.exercises.first.maxVariant,
        0,
      );
    },
  );

  test(
    'seeds equipment item requirements',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final items =
          await database.getEquipmentItemsWithAllData();

      final casco =
          items.firstWhere(
        (item) => item.id == 'casco_mejorado',
      );

      expect(
        casco.unlockRequirements.level,
        2,
      );

      expect(
        casco.equipRequirements.stats['stamina'],
        10,
      );
    },
  );

  test(
    'seeds equipment item stats',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final items =
          await database.getEquipmentItemsWithAllData();

      final item =
          items.firstWhere(
        (item) => item.id == 'mejora_nivel',
      );

      expect(item.stats['strength'], 30);
      expect(item.stats['endurance'], 30);
      expect(item.stats['energy'], 30);
      expect(item.stats['stamina'], 30);
    },
  );

  test(
    'seeds unequipable equipment item requirements',
    () async {
      await ExerciseSeeder.seed(database);
      await EquipmentItemSeeder.seed(database);

      final items =
          await database.getEquipmentItemsWithAllData();

      final item =
          items.firstWhere(
        (item) => item.id == 'item_inequipable',
      );

      expect(
        item.equipRequirements.stats['stamina'],
        100000,
      );
    },
  );
}