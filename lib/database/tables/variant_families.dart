import 'package:drift/drift.dart';

@DataClassName('VariantFamilyRow')
class VariantFamilies extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get unit => text()();

  @override
  Set<Column> get primaryKey => {id};
}
