import 'package:drift/drift.dart';

@DataClassName('TrainingRecordRow')
class TrainingRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get completedAt => dateTime()();

  IntColumn get strengthGained => integer().withDefault(
    const Constant(0),
  )();

  IntColumn get enduranceGained => integer().withDefault(
    const Constant(0),
  )();

  IntColumn get energyGained => integer().withDefault(
    const Constant(0),
  )();

  IntColumn get staminaGained => integer().withDefault(
    const Constant(0),
  )();
}