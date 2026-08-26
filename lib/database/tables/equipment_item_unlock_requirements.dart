import 'package:drift/drift.dart';

import 'equipment_items.dart';

@DataClassName('EquipmentItemUnlockRequirementRow')
class EquipmentItemUnlockRequirements
    extends Table {
  IntColumn get id =>
      integer().autoIncrement()();

  TextColumn get equipmentItemId =>
      text().references(
        EquipmentItems,
        #id,
      )();

  TextColumn get condition =>
      text()();

  IntColumn get value =>
      integer()();
}
