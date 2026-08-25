import 'package:drift/drift.dart';

@DataClassName('ExerciseRow')
class Exercises extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();
}
