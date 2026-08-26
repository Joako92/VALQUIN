import 'package:drift/drift.dart';

@DataClassName('EquipmentItemExerciseRow')
class EquipmentItemExercises extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get equipmentItemId => text()();

  TextColumn get exerciseId => text()();

  IntColumn get maxVariant => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {
          equipmentItemId,
          exerciseId,
        },
      ];
}