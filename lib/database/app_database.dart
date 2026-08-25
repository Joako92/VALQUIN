import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// Tables import
import 'tables/test_entries.dart';
import 'tables/exercise_variants.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TestEntries,
    ExerciseVariants,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
          executor ??
              driftDatabase(
                name: 'solo_training',
              ),
        );

  @override
  int get schemaVersion => 1;

  Future<int> insertTestEntry({
    required String name,
    required int value,
  }) {
    return into(testEntries).insert(
      TestEntriesCompanion.insert(
        name: name,
        value: value,
      ),
    );
  }

  Future<TestEntry?> getTestEntry(int id) {
    return (select(testEntries)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateTestEntry({
    required int id,
    required String name,
    required int value,
  }) async {
    final updatedRows = await (update(testEntries)
          ..where((table) => table.id.equals(id)))
        .write(
      TestEntriesCompanion(
        name: Value(name),
        value: Value(value),
      ),
    );

    return updatedRows > 0;
  }

  Future<bool> deleteTestEntry(int id) async {
    final deletedRows = await (delete(testEntries)
          ..where((table) => table.id.equals(id)))
        .go();

    return deletedRows > 0;
  }

  Future<int> insertExerciseVariant({
    required int variantIndex,
    int? sets,
    required double amount,
    required String unit,
  }) {
    return into(exerciseVariants).insert(
      ExerciseVariantsCompanion.insert(
        variantIndex: variantIndex,
        sets: Value(sets),
        amount: amount,
        unit: unit,
      ),
    );
  }

  Future<ExerciseVariant?> getExerciseVariant(int id) {
    return (select(exerciseVariants)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateExerciseVariant({
    required int id,
    required int variantIndex,
    int? sets,
    required double amount,
    required String unit,
  }) {
    return (update(exerciseVariants)
          ..where((table) => table.id.equals(id)))
        .write(
      ExerciseVariantsCompanion(
        variantIndex: Value(variantIndex),
        sets: Value(sets),
        amount: Value(amount),
        unit: Value(unit),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool> deleteExerciseVariant(int id) {
    return (delete(exerciseVariants)
          ..where((table) => table.id.equals(id)))
        .go()
        .then((rows) => rows > 0);
  }
}