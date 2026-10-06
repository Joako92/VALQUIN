import 'package:drift/drift.dart';

@DataClassName('ExerciseVariantRow')
class ExerciseVariants extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get familyId => text()();

  IntColumn get variantIndex => integer()();

  IntColumn get sets => integer().nullable()();

  RealColumn get amount => real()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {
      familyId,
      variantIndex,
    },
  ];
}
