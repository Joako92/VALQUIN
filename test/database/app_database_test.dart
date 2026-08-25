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
}