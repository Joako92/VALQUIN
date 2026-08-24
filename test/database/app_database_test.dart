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
}