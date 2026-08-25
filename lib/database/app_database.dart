import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// Tables
import 'tables/test_entries.dart';
import 'tables/exercise_variants.dart';
import 'tables/exercises.dart';
import 'tables/exercise_variant_links.dart';

// Domain models
import '../models/exercise.dart' as domain;

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TestEntries,
    ExerciseVariants,
    Exercises,
    ExerciseVariantLinks,
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

  // --------------------------------------------------
  // TEST METHODS
  // --------------------------------------------------

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

  // --------------------------------------------------
  // EXERCISE VARIANT CRUD
  // --------------------------------------------------

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

  Future<ExerciseVariantRow?> getExerciseVariant(int id) {
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

  // --------------------------------------------------
  // EXERCISE CRUD
  // --------------------------------------------------

  Future<void> insertExercise({
    required String id,
    required String name,
  }) {
    return into(exercises).insert(
      ExercisesCompanion.insert(
        id: id,
        name: name,
      ),
    );
  }

  Future<ExerciseRow?> getExercise(String id) {
    return (select(exercises)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateExercise({
    required String id,
    required String name,
  }) {
    return (update(exercises)
          ..where((table) => table.id.equals(id)))
        .write(
      ExercisesCompanion(
        name: Value(name),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool> deleteExercise(String id) {
    return (delete(exercises)
          ..where((table) => table.id.equals(id)))
        .go()
        .then((rows) => rows > 0);
  }

  // --------------------------------------------------
  // EXERCISE VARIANT LINKS
  // --------------------------------------------------

  Future<int> insertExerciseVariantLink({
    required String exerciseId,
    required int variantId,
  }) {
    return into(exerciseVariantLinks).insert(
      ExerciseVariantLinksCompanion.insert(
        exerciseId: exerciseId,
        variantId: variantId,
      ),
    );
  }

  Future<ExerciseVariantLink?> getExerciseVariantLink(int id) {
    return (select(exerciseVariantLinks)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<ExerciseVariantLink>> getExerciseVariantLinks(
    String exerciseId,
  ) {
    return (select(exerciseVariantLinks)
          ..where((table) => table.exerciseId.equals(exerciseId)))
        .get();
  }

  Future<List<ExerciseVariantRow>> getExerciseVariants(
    String exerciseId,
  ) {
    final query = select(exerciseVariants).join([
      innerJoin(
        exerciseVariantLinks,
        exerciseVariantLinks.variantId.equalsExp(
          exerciseVariants.id,
        ),
      ),
    ])
      ..where(
        exerciseVariantLinks.exerciseId.equals(exerciseId),
      );

    return query.map((row) {
      return row.readTable(exerciseVariants);
    }).get();
  }

  // --------------------------------------------------
  // DOMAIN EXERCISE
  // --------------------------------------------------

  Future<domain.Exercise?> getExerciseWithVariants(
    String exerciseId,
  ) async {
    final exercise =
        await getExercise(exerciseId);

    if (exercise == null) {
      return null;
    }

    final variants =
        await getExerciseVariants(exerciseId);

    return domain.Exercise(
      id: exercise.id,
      name: exercise.name,
      variants: variants
          .map(
            (variant) => domain.ExerciseVariant(
              index: variant.variantIndex,
              sets: variant.sets,
              amount: variant.amount,
              unit: variant.unit,
            ),
          )
          .toList(),
    );
  }

  Future<List<domain.Exercise>> getExercisesWithVariants() async {
    final exercises =
        await select(this.exercises).get();

    final result = <domain.Exercise>[];

    for (final exercise in exercises) {
      final exerciseWithVariants =
          await getExerciseWithVariants(exercise.id);

      if (exerciseWithVariants != null) {
        result.add(exerciseWithVariants);
      }
    }

    return result;
  }
}