import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// --------------------------------------------------
// TABLES
// --------------------------------------------------

import 'tables/test_entries.dart';
import 'tables/exercise_variants.dart';
import 'tables/exercises.dart';
import 'tables/exercise_variant_links.dart';
import 'tables/equipment_items.dart';
import 'tables/equipment_item_exercises.dart';
import 'tables/equipment_item_stats.dart';
import 'tables/equipment_item_unlock_requirements.dart';
import 'tables/equipment_item_equip_requirements.dart';

// --------------------------------------------------
// DOMAIN MODELS
// --------------------------------------------------

import '../models/exercise.dart' as exercise_domain;
import '../models/equipment_item.dart' as equipment_domain;
import '../models/equipment_slot.dart';
import '../models/rarity.dart';
import '../models/requirement.dart';
import '../models/player_class.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TestEntries,
    ExerciseVariants,
    Exercises,
    ExerciseVariantLinks,
    EquipmentItems,
    EquipmentItemExercises,
    EquipmentItemStats,
    EquipmentItemUnlockRequirements,
    EquipmentItemEquipRequirements,
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

  // ==================================================
  // TEST METHODS
  // ==================================================

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

  // ==================================================
  // EXERCISE VARIANT CRUD
  // ==================================================

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

  // ==================================================
  // EXERCISE CRUD
  // ==================================================

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

  Future<void> replaceExercise({
    required String id,
    required String name,
    required List<exercise_domain.ExerciseVariant> variants,
  }) async {
    await transaction(() async {
      // --------------------------------------------------
      // DELETE EXISTING DATA
      // --------------------------------------------------

      final links =
          await getExerciseVariantLinks(id);

      await (delete(exerciseVariantLinks)
            ..where(
              (table) => table.exerciseId.equals(id),
            ))
          .go();

      for (final link in links) {
        await (delete(exerciseVariants)
              ..where(
                (table) => table.id.equals(link.variantId),
              ))
            .go();
      }

      // --------------------------------------------------
      // INSERT / UPDATE EXERCISE
      // --------------------------------------------------

      final existing =
          await getExercise(id);

      if (existing != null) {
        await updateExercise(
          id: id,
          name: name,
        );
      } else {
        await insertExercise(
          id: id,
          name: name,
        );
      }

      // --------------------------------------------------
      // INSERT NEW VARIANTS
      // --------------------------------------------------

      for (final variant in variants) {
        final variantId =
            await insertExerciseVariant(
          variantIndex: variant.index,
          sets: variant.sets,
          amount: variant.amount,
          unit: variant.unit,
        );

        await insertExerciseVariantLink(
          exerciseId: id,
          variantId: variantId,
        );
      }
    });
  }

  // ==================================================
  // EXERCISE VARIANT LINKS
  // ==================================================

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

  Future<ExerciseVariantLink?> getExerciseVariantLink(
    int id,
  ) {
    return (select(exerciseVariantLinks)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<ExerciseVariantLink>> getExerciseVariantLinks(
    String exerciseId,
  ) {
    return (select(exerciseVariantLinks)
          ..where(
            (table) => table.exerciseId.equals(exerciseId),
          ))
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

  // ==================================================
  // DOMAIN EXERCISE
  // ==================================================

  Future<exercise_domain.Exercise?> getExerciseWithVariants(
    String exerciseId,
  ) async {
    final exercise = await getExercise(exerciseId);

    if (exercise == null) {
      return null;
    }

    final variants =
        await getExerciseVariants(exerciseId);

    return exercise_domain.Exercise(
      id: exercise.id,
      name: exercise.name,
      variants: variants
          .map(
            (variant) => exercise_domain.ExerciseVariant(
              index: variant.variantIndex,
              sets: variant.sets,
              amount: variant.amount,
              unit: variant.unit,
            ),
          )
          .toList(),
    );
  }

  Future<List<exercise_domain.Exercise>>
      getExercisesWithVariants() async {
    final exerciseRows =
        await select(exercises).get();

    final result =
        <exercise_domain.Exercise>[];

    for (final exercise in exerciseRows) {
      final domainExercise =
          await getExerciseWithVariants(
        exercise.id,
      );

      if (domainExercise != null) {
        result.add(domainExercise);
      }
    }

    return result;
  }

  // ==================================================
  // EQUIPMENT ITEM CRUD
  // ==================================================

  Future<int> insertEquipmentItem({
    required String id,
    required String name,
    required String rarity,
    required String slot,
    required int cooldownHours,
  }) {
    return into(equipmentItems).insert(
      EquipmentItemsCompanion.insert(
        id: id,
        name: name,
        rarity: rarity,
        slot: slot,
        cooldownHours: cooldownHours,
      ),
    );
  }

  Future<EquipmentItemRow?> getEquipmentItem(
    String id,
  ) {
    return (select(equipmentItems)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateEquipmentItem({
    required String id,
    required String name,
    required String rarity,
    required String slot,
    required int cooldownHours,
  }) {
    return (update(equipmentItems)
          ..where((table) => table.id.equals(id)))
        .write(
      EquipmentItemsCompanion(
        name: Value(name),
        rarity: Value(rarity),
        slot: Value(slot),
        cooldownHours: Value(cooldownHours),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool> deleteEquipmentItem(
    String id,
  ) {
    return (delete(equipmentItems)
          ..where((table) => table.id.equals(id)))
        .go()
        .then((rows) => rows > 0);
  }

  Future<void> replaceEquipmentItem({
    required String id,
    required String name,
    required String rarity,
    required String slot,
    required int cooldownHours,
    required List<equipment_domain.EquipmentExercise> exercises,
    required Map<String, int> stats,
    required Requirement unlockRequirements,
    required Requirement equipRequirements,
  }) async {
    await transaction(() async {
      // --------------------------------------------------
      // DELETE EXISTING RELATED DATA
      // --------------------------------------------------

      await (delete(equipmentItemExercises)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(id),
            ))
          .go();

      await (delete(equipmentItemStats)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(id),
            ))
          .go();

      await (delete(equipmentItemUnlockRequirements)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(id),
            ))
          .go();

      await (delete(equipmentItemEquipRequirements)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(id),
            ))
          .go();

      // --------------------------------------------------
      // INSERT / UPDATE BASE ITEM
      // --------------------------------------------------

      final existing =
          await getEquipmentItem(id);

      if (existing != null) {
        await updateEquipmentItem(
          id: id,
          name: name,
          rarity: rarity,
          slot: slot,
          cooldownHours: cooldownHours,
        );
      } else {
        await insertEquipmentItem(
          id: id,
          name: name,
          rarity: rarity,
          slot: slot,
          cooldownHours: cooldownHours,
        );
      }

      // --------------------------------------------------
      // EXERCISES
      // --------------------------------------------------

      for (final equipmentExercise in exercises) {
        await insertEquipmentItemExercise(
          equipmentItemId: id,
          exerciseId: equipmentExercise.exerciseId,
          maxVariant: equipmentExercise.maxVariant,
        );
      }

      // --------------------------------------------------
      // STATS
      // --------------------------------------------------

      for (final entry in stats.entries) {
        await insertEquipmentItemStat(
          equipmentItemId: id,
          stat: entry.key,
          value: entry.value,
        );
      }

      // --------------------------------------------------
      // UNLOCK REQUIREMENTS
      // --------------------------------------------------

      if (unlockRequirements.level != null) {
        await insertEquipmentItemUnlockRequirement(
          equipmentItemId: id,
          condition: 'level',
          value: unlockRequirements.level!,
        );
      }

      for (final entry
          in unlockRequirements.stats.entries) {
        await insertEquipmentItemUnlockRequirement(
          equipmentItemId: id,
          condition: entry.key,
          value: entry.value,
        );
      }

      for (final playerClass in unlockRequirements.classes) {
        await insertEquipmentItemUnlockRequirement(
          equipmentItemId: id,
          condition: 'class',
          value: playerClass.index,
        );
      }

      // --------------------------------------------------
      // EQUIP REQUIREMENTS
      // --------------------------------------------------

      if (equipRequirements.level != null) {
        await insertEquipmentItemEquipRequirement(
          equipmentItemId: id,
          condition: 'level',
          value: equipRequirements.level!,
        );
      }

      for (final entry
          in equipRequirements.stats.entries) {
        await insertEquipmentItemEquipRequirement(
          equipmentItemId: id,
          condition: entry.key,
          value: entry.value,
        );
      }

      for (final playerClass in equipRequirements.classes) {
        await insertEquipmentItemEquipRequirement(
          equipmentItemId: id,
          condition: 'class',
          value: playerClass.index,
        );
      }
    });
  }

  // ==================================================
  // EQUIPMENT ITEM EXERCISES CRUD
  // ==================================================

  Future<int> insertEquipmentItemExercise({
    required String equipmentItemId,
    required String exerciseId,
    required int maxVariant,
  }) {
    return into(equipmentItemExercises).insert(
      EquipmentItemExercisesCompanion.insert(
        equipmentItemId: equipmentItemId,
        exerciseId: exerciseId,
        maxVariant: Value(maxVariant),
      ),
    );
  }

  Future<EquipmentItemExerciseRow?>
      getEquipmentItemExercise(
    int id,
  ) {
    return (select(equipmentItemExercises)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<EquipmentItemExerciseRow>>
      getEquipmentItemExercises(
    String equipmentItemId,
  ) {
    return (select(equipmentItemExercises)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .get();
  }

  Future<bool> updateEquipmentItemExercise({
    required int id,
    required int maxVariant,
  }) {
    return (update(equipmentItemExercises)
          ..where((table) => table.id.equals(id)))
        .write(
      EquipmentItemExercisesCompanion(
        maxVariant: Value(maxVariant),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool> deleteEquipmentItemExercise(
    int id,
  ) {
    return (delete(equipmentItemExercises)
          ..where((table) => table.id.equals(id)))
        .go()
        .then((rows) => rows > 0);
  }

  // ==================================================
  // EQUIPMENT ITEM STATS CRUD
  // ==================================================

  Future<int> insertEquipmentItemStat({
    required String equipmentItemId,
    required String stat,
    required int value,
  }) {
    return into(equipmentItemStats).insert(
      EquipmentItemStatsCompanion.insert(
        equipmentItemId: equipmentItemId,
        stat: stat,
        value: value,
      ),
    );
  }

  Future<EquipmentItemStatRow?>
      getEquipmentItemStat(
    int id,
  ) {
    return (select(equipmentItemStats)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<EquipmentItemStatRow>>
      getEquipmentItemStatRows(
    String equipmentItemId,
  ) {
    return (select(equipmentItemStats)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .get();
  }

  Future<bool> updateEquipmentItemStat({
    required int id,
    required String stat,
    required int value,
  }) {
    return (update(equipmentItemStats)
          ..where((table) => table.id.equals(id)))
        .write(
      EquipmentItemStatsCompanion(
        stat: Value(stat),
        value: Value(value),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool> deleteEquipmentItemStat(
    int id,
  ) {
    return (delete(equipmentItemStats)
          ..where((table) => table.id.equals(id)))
        .go()
        .then((rows) => rows > 0);
  }

  Future<Map<String, int>> getEquipmentItemStats(
    String equipmentItemId,
  ) async {
    final rows =
        await getEquipmentItemStatRows(
      equipmentItemId,
    );

    return {
      for (final row in rows)
        row.stat: row.value,
    };
  }

  // ==================================================
  // EQUIPMENT ITEM UNLOCK REQUIREMENTS CRUD
  // ==================================================

  Future<int>
      insertEquipmentItemUnlockRequirement({
    required String equipmentItemId,
    required String condition,
    required int value,
  }) {
    return into(
      equipmentItemUnlockRequirements,
    ).insert(
      EquipmentItemUnlockRequirementsCompanion.insert(
        equipmentItemId: equipmentItemId,
        condition: condition,
        value: value,
      ),
    );
  }

  Future<EquipmentItemUnlockRequirementRow?>
      getEquipmentItemUnlockRequirement(
    int id,
  ) {
    return (select(
      equipmentItemUnlockRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .getSingleOrNull();
  }

  Future<List<EquipmentItemUnlockRequirementRow>>
      getEquipmentItemUnlockRequirements(
    String equipmentItemId,
  ) {
    return (select(
      equipmentItemUnlockRequirements,
    )
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .get();
  }

  Future<bool>
      updateEquipmentItemUnlockRequirement({
    required int id,
    required String condition,
    required int value,
  }) {
    return (update(
      equipmentItemUnlockRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .write(
      EquipmentItemUnlockRequirementsCompanion(
        condition: Value(condition),
        value: Value(value),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool>
      deleteEquipmentItemUnlockRequirement(
    int id,
  ) {
    return (delete(
      equipmentItemUnlockRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .go()
        .then((rows) => rows > 0);
  }

  // ==================================================
  // EQUIPMENT ITEM EQUIP REQUIREMENTS CRUD
  // ==================================================

  Future<int>
      insertEquipmentItemEquipRequirement({
    required String equipmentItemId,
    required String condition,
    required int value,
  }) {
    return into(
      equipmentItemEquipRequirements,
    ).insert(
      EquipmentItemEquipRequirementsCompanion.insert(
        equipmentItemId: equipmentItemId,
        condition: condition,
        value: value,
      ),
    );
  }

  Future<EquipmentItemEquipRequirementRow?>
      getEquipmentItemEquipRequirement(
    int id,
  ) {
    return (select(
      equipmentItemEquipRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .getSingleOrNull();
  }

  Future<List<EquipmentItemEquipRequirementRow>>
      getEquipmentItemEquipRequirements(
    String equipmentItemId,
  ) {
    return (select(
      equipmentItemEquipRequirements,
    )
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .get();
  }

  Future<bool>
      updateEquipmentItemEquipRequirement({
    required int id,
    required String condition,
    required int value,
  }) {
    return (update(
      equipmentItemEquipRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .write(
      EquipmentItemEquipRequirementsCompanion(
        condition: Value(condition),
        value: Value(value),
      ),
    ).then((rows) => rows > 0);
  }

  Future<bool>
      deleteEquipmentItemEquipRequirement(
    int id,
  ) {
    return (delete(
      equipmentItemEquipRequirements,
    )
          ..where(
            (table) => table.id.equals(id),
          ))
        .go()
        .then((rows) => rows > 0);
  }

  // ==================================================
  // DOMAIN REQUIREMENTS
  // ==================================================

  Requirement _buildEquipmentRequirement(
    List<dynamic> rows,
  ) {
    int? level;
    final stats = <String, int>{};
    final classes = <PlayerClass>{};

    for (final row in rows) {
      if (row.condition == 'level') {
        level = row.value;
      } else if (row.condition == 'class') {
        classes.add(
          PlayerClass.values[row.value],
        );
      } else {
        stats[row.condition] = row.value;
      }
    }

    return Requirement(
      level: level,
      stats: stats,
      classes: classes,
    );
  }

  // ==================================================
  // DOMAIN EQUIPMENT ITEM
  // ==================================================

  Future<equipment_domain.EquipmentItem?>
      getEquipmentItemWithAllData(
    String equipmentItemId,
  ) async {
    // --------------------------------------------------
    // BASE ITEM
    // --------------------------------------------------

    final equipmentItem =
        await getEquipmentItem(
      equipmentItemId,
    );

    if (equipmentItem == null) {
      return null;
    }

    // --------------------------------------------------
    // EXERCISES
    // --------------------------------------------------

    final exerciseRelations =
        await getEquipmentItemExercises(
      equipmentItemId,
    );

    final equipmentExercises =
        exerciseRelations
            .map(
              (relation) =>
                  equipment_domain.EquipmentExercise(
                exerciseId: relation.exerciseId,
                maxVariant: relation.maxVariant,
              ),
            )
            .toList();

    // --------------------------------------------------
    // STATS
    // --------------------------------------------------

    final stats =
        await getEquipmentItemStats(
      equipmentItemId,
    );

    // --------------------------------------------------
    // UNLOCK REQUIREMENTS
    // --------------------------------------------------

    final unlockRows =
        await getEquipmentItemUnlockRequirements(
      equipmentItemId,
    );

    final unlockRequirements =
        _buildEquipmentRequirement(
      unlockRows,
    );

    // --------------------------------------------------
    // EQUIP REQUIREMENTS
    // --------------------------------------------------

    final equipRows =
        await getEquipmentItemEquipRequirements(
      equipmentItemId,
    );

    final equipRequirements =
        _buildEquipmentRequirement(
      equipRows,
    );

    // --------------------------------------------------
    // DOMAIN MODEL
    // --------------------------------------------------

    return equipment_domain.EquipmentItem(
      id: equipmentItem.id,
      name: equipmentItem.name,
      exercises: equipmentExercises,

      rarity: Rarity.values.firstWhere(
        (rarity) =>
            rarity.name == equipmentItem.rarity,
      ),

      slot: EquipmentSlot.values.firstWhere(
        (slot) =>
            slot.name == equipmentItem.slot,
      ),

      cooldownHours:
          equipmentItem.cooldownHours,

      stats: stats,

      unlockRequirements:
          unlockRequirements,

      equipRequirements:
          equipRequirements,
    );
  }

  Future<List<equipment_domain.EquipmentItem>>
      getEquipmentItemsWithAllData() async {
    final equipmentItems =
        await select(this.equipmentItems).get();

    final result =
        <equipment_domain.EquipmentItem>[];

    for (final equipmentItem in equipmentItems) {
      final item =
          await getEquipmentItemWithAllData(
        equipmentItem.id,
      );

      if (item != null) {
        result.add(item);
      }
    }

    return result;
  }

  Future<equipment_domain.EquipmentItem?>
      getEquipmentItemWithExercises(
    String equipmentItemId,
  ) async {
    return getEquipmentItemWithAllData(
      equipmentItemId,
    );
  }

  Future<List<equipment_domain.EquipmentItem>>
      getEquipmentItemsWithExercises() async {
    return getEquipmentItemsWithAllData();
  }

  // --------------------------------------------------
  // ADMIN METHODS
  // --------------------------------------------------

  Future<bool> deleteExerciseCompletely(
    String exerciseId,
  ) async {
    return transaction(() async {
      // 1. Obtener las variantes asociadas al ejercicio
      final links = await getExerciseVariantLinks(exerciseId);

      // 2. Eliminar las relaciones EquipmentItem -> Exercise
      await (delete(equipmentItemExercises)
            ..where(
              (table) => table.exerciseId.equals(exerciseId),
            ))
          .go();

      // 3. Eliminar los links Exercise -> Variant
      await (delete(exerciseVariantLinks)
            ..where(
              (table) => table.exerciseId.equals(exerciseId),
            ))
          .go();

      // 4. Eliminar las variantes que pertenecían al ejercicio
      for (final link in links) {
        await (delete(exerciseVariants)
              ..where(
                (table) => table.id.equals(link.variantId),
              ))
            .go();
      }

      // 5. Finalmente eliminar el ejercicio
      final deletedRows =
          await (delete(exercises)
                ..where(
                  (table) => table.id.equals(exerciseId),
                ))
              .go();

      return deletedRows > 0;
    });
  }

  Future<bool> deleteEquipmentItemCompletely(
    String equipmentItemId,
  ) async {
    return transaction(() async {
      // 1. Eliminar relaciones EquipmentItem -> Exercise
      await (delete(equipmentItemExercises)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(equipmentItemId),
            ))
          .go();

      // 2. Eliminar stats
      await (delete(equipmentItemStats)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(equipmentItemId),
            ))
          .go();

      // 3. Eliminar unlock requirements
      await (delete(equipmentItemUnlockRequirements)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(equipmentItemId),
            ))
          .go();

      // 4. Eliminar equip requirements
      await (delete(equipmentItemEquipRequirements)
            ..where(
              (table) =>
                  table.equipmentItemId.equals(equipmentItemId),
            ))
          .go();

      // 5. Finalmente eliminar el equipment item
      final deletedRows =
          await (delete(equipmentItems)
                ..where(
                  (table) =>
                      table.id.equals(equipmentItemId),
                ))
              .go();

      return deletedRows > 0;
    });
  }
}