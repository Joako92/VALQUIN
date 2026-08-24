import 'package:drift/drift.dart';

class TestEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get value => integer()();
}