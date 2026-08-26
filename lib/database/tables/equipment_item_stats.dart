import 'package:drift/drift.dart';

@DataClassName('EquipmentItemStatRow')
class EquipmentItemStats extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get equipmentItemId => text()();

  TextColumn get stat => text()();

  IntColumn get value => integer()();
}