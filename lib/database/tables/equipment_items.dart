import 'package:drift/drift.dart';

@DataClassName('EquipmentItemRow')
class EquipmentItems extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get rarity => text()();

  TextColumn get slot => text()();

  IntColumn get cooldownHours => integer()();
}