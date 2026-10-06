import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:valquin/database/app_database.dart';
import 'package:valquin/database/seed/exercise_seeder.dart';

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
          await database.select(database.exercises).get();

      expect(exercises, isNotEmpty);

      for (final exercise in exercises) {
        expect(exercise.id, isNotEmpty);
        expect(exercise.name, isNotEmpty);
      }
    },
  );
}
