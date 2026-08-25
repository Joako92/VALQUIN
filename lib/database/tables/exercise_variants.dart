import 'package:drift/drift.dart';

@DataClassName('ExerciseVariantRow')
class ExerciseVariants extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get variantIndex => integer()();

  IntColumn get sets => integer().nullable()();

  RealColumn get amount => real()();

  TextColumn get unit => text()();
}
