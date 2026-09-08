import 'package:drift/drift.dart';

class AppSettings extends Table {
  IntColumn get id => integer()();

  IntColumn get accentColor => integer()();

  TextColumn get language => text()();

  @override
  Set<Column> get primaryKey => {id};
}