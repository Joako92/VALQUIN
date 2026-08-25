import 'package:drift/drift.dart';

class ExerciseVariantLinks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get exerciseId => text()();

  IntColumn get variantId => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {exerciseId, variantId},
  ];
}