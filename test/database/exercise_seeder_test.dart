import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import '../../lib/database/app_database.dart';
import '../../lib/database/seed/exercise_seeder.dart';
import '../../lib/data/exercises.dart';

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
    'seeds all exercises into the database',
    () async {
      await ExerciseSeeder.seed(database);

      for (final exercise in exercises) {
        final storedExercise =
            await database.getExercise(exercise.id);

        expect(storedExercise, isNotNull);
        expect(storedExercise!.id, exercise.id);
        expect(storedExercise.name, exercise.name);
      }
    },
  );

  test(
    'seeds all exercise variants and links',
    () async {
      await ExerciseSeeder.seed(database);

      for (final exercise in exercises) {
        final storedVariants =
            await database.getExerciseVariants(
          exercise.id,
        );

        expect(
          storedVariants.length,
          exercise.variants.length,
        );

        for (final expectedVariant in exercise.variants) {
          final matchingVariants =
              storedVariants.where(
            (variant) =>
                variant.variantIndex ==
                expectedVariant.index,
          );

          expect(matchingVariants.length, 1);

          final storedVariant =
              matchingVariants.first;

          expect(
            storedVariant.sets,
            expectedVariant.sets,
          );

          expect(
            storedVariant.amount,
            expectedVariant.amount,
          );

          expect(
            storedVariant.unit,
            expectedVariant.unit,
          );
        }
      }
    },
  );

  test(
    'reconstructs exercises from seeded database',
    () async {
      await ExerciseSeeder.seed(database);

      for (final expectedExercise in exercises) {
        final storedExercise =
            await database.getExerciseWithVariants(
          expectedExercise.id,
        );

        expect(storedExercise, isNotNull);

        expect(
          storedExercise!.id,
          expectedExercise.id,
        );

        expect(
          storedExercise.name,
          expectedExercise.name,
        );

        expect(
          storedExercise.variants.length,
          expectedExercise.variants.length,
        );

        for (final expectedVariant
            in expectedExercise.variants) {
          final actualVariant =
              storedExercise.getVariant(
            expectedVariant.index,
          );

          expect(
            actualVariant.sets,
            expectedVariant.sets,
          );

          expect(
            actualVariant.amount,
            expectedVariant.amount,
          );

          expect(
            actualVariant.unit,
            expectedVariant.unit,
          );
        }
      }
    },
  );
}
