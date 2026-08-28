import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:solo_training_001/database/app_database.dart';
import 'package:solo_training_001/database/seed/exercise_seeder.dart';

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
    'seeds exercises successfully',
    () async {
      await ExerciseSeeder.seed(database);

      final exercises =
          await database.getExercisesWithVariants();

      expect(exercises, isNotEmpty);

      for (final exercise in exercises) {
        expect(exercise.id, isNotEmpty);
        expect(exercise.name, isNotEmpty);
      }
    },
  );

  test(
    'seeds exercises with variants',
    () async {
      await ExerciseSeeder.seed(database);

      final exercises =
          await database.getExercisesWithVariants();

      expect(exercises, isNotEmpty);

      for (final exercise in exercises) {
        expect(exercise.variants, isNotEmpty);

        for (final variant in exercise.variants) {
          expect(variant.index, greaterThanOrEqualTo(0));
          expect(variant.amount, greaterThan(0));
          expect(variant.unit, isNotEmpty);
        }
      }
    },
  );
}