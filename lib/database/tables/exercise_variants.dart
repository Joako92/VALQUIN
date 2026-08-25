import 'package:drift/drift.dart';

class ExerciseVariants extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get variantIndex => integer()();

  IntColumn get sets => integer().nullable()();

  RealColumn get amount => real()();

  TextColumn get unit => text()();
}