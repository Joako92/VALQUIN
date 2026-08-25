import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import '../../lib/database/app_database.dart';

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
    'inserts and reads a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'Test',
        value: 100,
      );

      final entry =
          await database.getTestEntry(id);

      expect(entry, isNotNull);
      expect(entry!.name, 'Test');
      expect(entry.value, 100);
    },
  );

  test(
    'updates a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'Original',
        value: 100,
      );

      final updated = await database.updateTestEntry(
        id: id,
        name: 'Updated',
        value: 200,
      );

      expect(updated, isTrue);

      final entry =
          await database.getTestEntry(id);

      expect(entry, isNotNull);
      expect(entry!.name, 'Updated');
      expect(entry.value, 200);
    },
  );

  test(
    'deletes a test entry',
    () async {
      final id = await database.insertTestEntry(
        name: 'To delete',
        value: 100,
      );

      final deleted =
          await database.deleteTestEntry(id);

      expect(deleted, isTrue);

      final entry =
          await database.getTestEntry(id);

      expect(entry, isNull);
    },
  );

  test(
    'inserts and reads an exercise variant',
    () async {
      final id = await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final variant =
          await database.getExerciseVariant(id);

      expect(variant, isNotNull);
      expect(variant!.variantIndex, 0);
      expect(variant.sets, 3);
      expect(variant.amount, 10);
      expect(variant.unit, 'reps');
    },
  );

  test(
    'updates an exercise variant',
    () async {
      final id = await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final updated =
          await database.updateExerciseVariant(
        id: id,
        variantIndex: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      );

      expect(updated, isTrue);

      final variant =
          await database.getExerciseVariant(id);

      expect(variant, isNotNull);
      expect(variant!.variantIndex, 1);
      expect(variant.sets, 4);
      expect(variant.amount, 12);
      expect(variant.unit, 'reps');
    },
  );

  test(
    'deletes an exercise variant',
    () async {
      final id = await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final deleted =
          await database.deleteExerciseVariant(id);

      expect(deleted, isTrue);

      final variant =
          await database.getExerciseVariant(id);

      expect(variant, isNull);
    },
  );

  // Exercise CRUD tests

  test(
    'inserts and reads an exercise',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final exercise =
          await database.getExercise('push_up');

      expect(exercise, isNotNull);
      expect(exercise!.id, 'push_up');
      expect(exercise.name, 'Push Up');
    },
  );

  test(
    'updates an exercise',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final updated =
          await database.updateExercise(
        id: 'push_up',
        name: 'Push Up Advanced',
      );

      expect(updated, isTrue);

      final exercise =
          await database.getExercise('push_up');

      expect(exercise, isNotNull);
      expect(exercise!.name, 'Push Up Advanced');
    },
  );

  test(
    'deletes an exercise',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final deleted =
          await database.deleteExercise('push_up');

      expect(deleted, isTrue);

      final exercise =
          await database.getExercise('push_up');

      expect(exercise, isNull);
    },
  );

  // Exercise variant links

  test(
    'prevents duplicate exercise variant links',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variantId =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variantId,
      );

      expect(
        () => database.insertExerciseVariantLink(
          exerciseId: 'push_up',
          variantId: variantId,
        ),
        throwsA(isA<Exception>()),
      );
    },
  );

  test(
    'inserts an exercise variant link',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variantId =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final linkId =
          await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variantId,
      );

      expect(linkId, isPositive);
    },
  );

  test(
    'reads exercise variant links',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variantId =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final linkId =
          await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variantId,
      );

      final link =
          await database.getExerciseVariantLink(linkId);

      expect(link, isNotNull);
      expect(link!.exerciseId, 'push_up');
      expect(link.variantId, variantId);
    },
  );

  test(
    'reads all variant links for an exercise',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variant1 =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final variant2 =
          await database.insertExerciseVariant(
        variantIndex: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant1,
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant2,
      );

      final links =
          await database.getExerciseVariantLinks('push_up');

      expect(links.length, 2);
      expect(links[0].variantId, variant1);
      expect(links[1].variantId, variant2);
    },
  );

  test(
    'reads exercise variants',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variant1 =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final variant2 =
          await database.insertExerciseVariant(
        variantIndex: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant1,
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant2,
      );

      final variants =
          await database.getExerciseVariants('push_up');

      expect(variants.length, 2);

      expect(variants[0].id, variant1);
      expect(variants[0].variantIndex, 0);
      expect(variants[0].sets, 3);
      expect(variants[0].amount, 10);
      expect(variants[0].unit, 'reps');

      expect(variants[1].id, variant2);
      expect(variants[1].variantIndex, 1);
      expect(variants[1].sets, 4);
      expect(variants[1].amount, 12);
      expect(variants[1].unit, 'reps');
    },
  );

  // Full exercise

  test(
    'reads an exercise with its variants',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      final variant1 =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final variant2 =
          await database.insertExerciseVariant(
        variantIndex: 1,
        sets: 4,
        amount: 12,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant1,
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: variant2,
      );

      final exercise =
          await database.getExerciseWithVariants(
        'push_up',
      );

      expect(exercise, isNotNull);

      expect(exercise!.id, 'push_up');
      expect(exercise.name, 'Push Up');

      expect(exercise.variants.length, 2);

      expect(exercise.variants[0].index, 0);
      expect(exercise.variants[0].sets, 3);
      expect(exercise.variants[0].amount, 10);
      expect(exercise.variants[0].unit, 'reps');

      expect(exercise.variants[1].index, 1);
      expect(exercise.variants[1].sets, 4);
      expect(exercise.variants[1].amount, 12);
      expect(exercise.variants[1].unit, 'reps');
    },
  );

  test(
    'reads all exercises with their variants',
    () async {
      await database.insertExercise(
        id: 'push_up',
        name: 'Push Up',
      );

      await database.insertExercise(
        id: 'squat',
        name: 'Squat',
      );

      final pushUpVariant =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 10,
        unit: 'reps',
      );

      final squatVariant =
          await database.insertExerciseVariant(
        variantIndex: 0,
        sets: 3,
        amount: 15,
        unit: 'reps',
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'push_up',
        variantId: pushUpVariant,
      );

      await database.insertExerciseVariantLink(
        exerciseId: 'squat',
        variantId: squatVariant,
      );

      final exercises =
          await database.getExercisesWithVariants();

      expect(exercises.length, 2);

      final pushUp =
          exercises.firstWhere(
        (exercise) => exercise.id == 'push_up',
      );

      final squat =
          exercises.firstWhere(
        (exercise) => exercise.id == 'squat',
      );

      expect(pushUp.name, 'Push Up');
      expect(pushUp.variants.length, 1);
      expect(pushUp.variants.first.index, 0);
      expect(pushUp.variants.first.sets, 3);
      expect(pushUp.variants.first.amount, 10);
      expect(pushUp.variants.first.unit, 'reps');

      expect(squat.name, 'Squat');
      expect(squat.variants.length, 1);
      expect(squat.variants.first.index, 0);
      expect(squat.variants.first.sets, 3);
      expect(squat.variants.first.amount, 15);
      expect(squat.variants.first.unit, 'reps');
    },
  );
}