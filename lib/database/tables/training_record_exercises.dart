import 'package:drift/drift.dart';

@DataClassName('TrainingRecordExerciseRow')
class TrainingRecordExercises extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get trainingRecordId => integer()();

  TextColumn get exerciseId => text()();

  IntColumn get variantIndex => integer()();

  IntColumn get sets => integer().nullable()();

  RealColumn get amount => real()();

  TextColumn get unit => text()();
}