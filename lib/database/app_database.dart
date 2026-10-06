import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// --------------------------------------------------
// TABLES
// --------------------------------------------------

import 'tables/test_entries.dart';
import 'tables/exercise_variants.dart';
import 'tables/exercises.dart';
import 'tables/variant_families.dart';
import 'tables/equipment_items.dart';
import 'tables/equipment_item_exercises.dart';
import 'tables/equipment_item_stats.dart';
import 'tables/equipment_item_unlock_requirements.dart';
import 'tables/equipment_item_equip_requirements.dart';
import 'tables/app_settings.dart';
import 'tables/training_records.dart';
import 'tables/training_record_exercises.dart';

// --------------------------------------------------
// DOMAIN MODELS
// --------------------------------------------------

import '../models/exercise_variant.dart' as exercise_variant_domain;
import '../models/variant_family.dart' as variant_family_domain;
import '../models/equipment_item.dart' as equipment_domain;
import '../models/equipment_slot.dart';
import '../models/rarity.dart';
import '../models/requirement.dart';
import '../models/player_class.dart';
import '../models/training_record_exercise.dart';
import '../models/training_record.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TestEntries,
    ExerciseVariants,
    Exercises,
    VariantFamilies,
    EquipmentItems,
    EquipmentItemExercises,
    EquipmentItemStats,
    EquipmentItemUnlockRequirements,
    EquipmentItemEquipRequirements,
    AppSettings,
    TrainingRecords,
    TrainingRecordExercises,
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
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(appSettings);
          }

          if (from < 3) {
            await m.addColumn(
              appSettings,
              appSettings.theme,
            );

            await customStatement(
              "UPDATE app_settings SET theme = 'dark' WHERE theme IS NULL",
            );
          }

          if (from < 4) {
            await m.createTable(trainingRecords);
            await m.createTable(trainingRecordExercises);
          }

          if (from < 5) {
            // Catalog data is disposable during development.
            // Rebuild the catalog tables using the new schema.
            //
            // Training history and app settings are intentionally preserved.

            await customStatement(
              'DROP TABLE IF EXISTS equipment_item_exercises',
            );

            await customStatement(
              'DROP TABLE IF EXISTS equipment_item_stats',
            );

            await customStatement(
              'DROP TABLE IF EXISTS equipment_item_unlock_requirements',
            );

            await customStatement(
              'DROP TABLE IF EXISTS equipment_item_equip_requirements',
            );

            await customStatement(
              'DROP TABLE IF EXISTS equipment_items',
            );

            await customStatement(
              'DROP TABLE IF EXISTS exercise_variants',
            );

            await customStatement(
              'DROP TABLE IF EXISTS variant_families',
            );

            await customStatement(
              'DROP TABLE IF EXISTS exercises',
            );

            await m.createTable(exercises);
            await m.createTable(variantFamilies);
            await m.createTable(exerciseVariants);
            await m.createTable(equipmentItems);
            await m.createTable(equipmentItemExercises);
            await m.createTable(equipmentItemStats);
            await m.createTable(
              equipmentItemUnlockRequirements,
            );
            await m.createTable(
              equipmentItemEquipRequirements,
            );
          }
        },
      );

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
    required String familyId,
    required int variantIndex,
    int? sets,
    required double amount,
  }) {
    return into(exerciseVariants).insert(
      ExerciseVariantsCompanion.insert(
        familyId: familyId,
        variantIndex: variantIndex,
        sets: Value(sets),
        amount: amount,
      ),
    );
  }

  Future<List<ExerciseVariantRow>> getVariantFamilyVariants(
    String familyId,
  ) {
    return (select(exerciseVariants)
          ..where(
            (table) => table.familyId.equals(familyId),
          )
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.variantIndex,
                  mode: OrderingMode.asc,
                ),
          ]))
        .get();
  }

  Future<ExerciseVariantRow?> getExerciseVariant(int id) {
    return (select(exerciseVariants)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateExerciseVariant({
    required int id,
    required String familyId,
    required int variantIndex,
    int? sets,
    required double amount,
  }) {
    return (update(exerciseVariants)
          ..where((table) => table.id.equals(id)))
        .write(
      ExerciseVariantsCompanion(
        familyId: Value(familyId),
        variantIndex: Value(variantIndex),
        sets: Value(sets),
        amount: Value(amount),
      ),
    )
        .then((rows) => rows > 0);
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
    )
        .then((rows) => rows > 0);
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
  }) async {
    final existing = await getExercise(id);

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
  }

  // ==================================================
  // VARIANT FAMILY CRUD
  // ==================================================

  Future<int> insertVariantFamily({
    required String id,
    required String name,
    required String unit,
  }) {
    return into(variantFamilies).insert(
      VariantFamiliesCompanion.insert(
        id: id,
        name: name,
        unit: unit,
      ),
    );
  }

  Future<VariantFamilyRow?> getVariantFamily(String id) {
    return (select(variantFamilies)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<VariantFamilyRow>> getVariantFamilies() {
    return select(variantFamilies).get();
  }

  Future<bool> updateVariantFamily({
    required String id,
    required String name,
    required String unit,
  }) {
    return (update(variantFamilies)
          ..where((table) => table.id.equals(id)))
        .write(
      VariantFamiliesCompanion(
        name: Value(name),
        unit: Value(unit),
      ),
    )
        .then((rows) => rows > 0);
  }

  Future<void> replaceVariantFamily({
    required variant_family_domain.VariantFamily family,
  }) async {
    await transaction(() async {
      final existing = await getVariantFamily(family.id);

      if (existing != null) {
        await updateVariantFamily(
          id: family.id,
          name: family.name,
          unit: family.unit,
        );
      } else {
        await insertVariantFamily(
          id: family.id,
          name: family.name,
          unit: family.unit,
        );
      }

      // The variant list is catalog data.
      // Replacing the family means replacing its variants.
      await (delete(exerciseVariants)
            ..where(
              (table) => table.familyId.equals(family.id),
            ))
          .go();

      for (final variant in family.variants) {
        await insertExerciseVariant(
          familyId: family.id,
          variantIndex: variant.index,
          sets: variant.sets,
          amount: variant.amount,
        );
      }
    });
  }

  Future<variant_family_domain.VariantFamily?>
      getVariantFamilyWithVariants(
    String id,
  ) async {
    final family = await getVariantFamily(id);

    if (family == null) {
      return null;
    }

    final variantRows = await getVariantFamilyVariants(id);

    return variant_family_domain.VariantFamily(
      id: family.id,
      name: family.name,
      unit: family.unit,
      variants: variantRows
          .map(
            (variant) =>
                exercise_variant_domain.ExerciseVariant(
              index: variant.variantIndex,
              sets: variant.sets,
              amount: variant.amount,
            ),
          )
          .toList(),
    );
  }

  Future<List<variant_family_domain.VariantFamily>>
      getVariantFamiliesWithVariants() async {
    final families = await getVariantFamilies();

    final result = <variant_family_domain.VariantFamily>[];

    for (final family in families) {
      final variantRows =
          await getVariantFamilyVariants(family.id);

      result.add(
        variant_family_domain.VariantFamily(
          id: family.id,
          name: family.name,
          unit: family.unit,
          variants: variantRows
              .map(
                (variant) =>
                    exercise_variant_domain.ExerciseVariant(
                  index: variant.variantIndex,
                  sets: variant.sets,
                  amount: variant.amount,
                ),
              )
              .toList(),
        ),
      );
    }

    return result;
  }

  Future<bool> deleteVariantFamily(String id) {
    return transaction(() async {
      // Remove equipment references first.
      await (delete(equipmentItemExercises)
            ..where(
              (table) => table.variantFamilyId.equals(id),
            ))
          .go();

      // Remove all variants belonging to the family.
      await (delete(exerciseVariants)
            ..where(
              (table) => table.familyId.equals(id),
            ))
          .go();

      // Finally remove the family itself.
      final deletedRows =
          await (delete(variantFamilies)
                ..where(
                  (table) => table.id.equals(id),
                ))
              .go();

      return deletedRows > 0;
    });
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
    )
        .then((rows) => rows > 0);
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

      final existing = await getEquipmentItem(id);

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
          variantFamilyId:
              equipmentExercise.variantFamilyId,
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

      for (final entry in unlockRequirements.stats.entries) {
        await insertEquipmentItemUnlockRequirement(
          equipmentItemId: id,
          condition: entry.key,
          value: entry.value,
        );
      }

      for (final playerClass
          in unlockRequirements.classes) {
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

      for (final entry in equipRequirements.stats.entries) {
        await insertEquipmentItemEquipRequirement(
          equipmentItemId: id,
          condition: entry.key,
          value: entry.value,
        );
      }

      for (final playerClass
          in equipRequirements.classes) {
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
    required String variantFamilyId,
    required int maxVariant,
  }) {
    return into(equipmentItemExercises).insert(
      EquipmentItemExercisesCompanion.insert(
        equipmentItemId: equipmentItemId,
        exerciseId: exerciseId,
        variantFamilyId: variantFamilyId,
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
    )
        .then((rows) => rows > 0);
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
    )
        .then((rows) => rows > 0);
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
        await getEquipmentItemStatRows(equipmentItemId);

    return {
      for (final row in rows)
        row.stat: row.value,
    };
  }

  // ==================================================
  // EQUIPMENT ITEM UNLOCK REQUIREMENTS CRUD
  // ==================================================

  Future<int> insertEquipmentItemUnlockRequirement({
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
    )
        .then((rows) => rows > 0);
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

  Future<int> insertEquipmentItemEquipRequirement({
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
    )
        .then((rows) => rows > 0);
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
        await getEquipmentItem(equipmentItemId);

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

    final equipmentExercises = exerciseRelations
        .map(
          (relation) =>
              equipment_domain.EquipmentExercise(
            exerciseId: relation.exerciseId,
            variantFamilyId:
                relation.variantFamilyId,
            maxVariant: relation.maxVariant,
          ),
        )
        .toList();

    // --------------------------------------------------
    // STATS
    // --------------------------------------------------

    final stats =
        await getEquipmentItemStats(equipmentItemId);

    // --------------------------------------------------
    // UNLOCK REQUIREMENTS
    // --------------------------------------------------

    final unlockRows =
        await getEquipmentItemUnlockRequirements(
      equipmentItemId,
    );

    final unlockRequirements =
        _buildEquipmentRequirement(unlockRows);

    // --------------------------------------------------
    // EQUIP REQUIREMENTS
    // --------------------------------------------------

    final equipRows =
        await getEquipmentItemEquipRequirements(
      equipmentItemId,
    );

    final equipRequirements =
        _buildEquipmentRequirement(equipRows);

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

  // ==================================================
  // ADMIN METHODS
  // ==================================================

  Future<bool> hasEquipmentItems() async {
    final items = await select(equipmentItems).get();

    return items.isNotEmpty;
  }

  Future<bool> deleteExerciseCompletely(
    String exerciseId,
  ) async {
    return transaction(() async {
      await (delete(equipmentItemExercises)
            ..where(
              (table) =>
                  table.exerciseId.equals(exerciseId),
            ))
          .go();

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
      return _deleteEquipmentItemCompletelyInternal(
        equipmentItemId,
      );
    });
  }

  Future<bool> deleteEquipmentItemsCompletely(
    List<String> equipmentItemIds,
  ) async {
    return transaction(() async {
      var allDeleted = true;

      for (final equipmentItemId
          in equipmentItemIds) {
        final deleted =
            await _deleteEquipmentItemCompletelyInternal(
          equipmentItemId,
        );

        if (!deleted) {
          allDeleted = false;
        }
      }

      return allDeleted;
    });
  }

  Future<bool>
      _deleteEquipmentItemCompletelyInternal(
    String equipmentItemId,
  ) async {
    // 1. Delete EquipmentItem -> Exercise relationships
    await (delete(equipmentItemExercises)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .go();

    // 2. Delete stats
    await (delete(equipmentItemStats)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .go();

    // 3. Delete unlock requirements
    await (delete(equipmentItemUnlockRequirements)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .go();

    // 4. Delete equip requirements
    await (delete(equipmentItemEquipRequirements)
          ..where(
            (table) =>
                table.equipmentItemId.equals(
              equipmentItemId,
            ),
          ))
        .go();

    // 5. Finally delete the equipment item
    final deletedRows =
        await (delete(equipmentItems)
              ..where(
                (table) =>
                    table.id.equals(
                  equipmentItemId,
                ),
              ))
            .go();

    return deletedRows > 0;
  }

  // ==================================================
  // TRAINING HISTORY
  // ==================================================

  Future<int> insertTrainingRecord({
    required DateTime completedAt,
    required int strengthGained,
    required int enduranceGained,
    required int energyGained,
    required int staminaGained,
    required List<TrainingRecordExercise> exercises,
  }) async {
    return transaction(() async {
      // --------------------------------------------------
      // TRAINING RECORD
      // --------------------------------------------------

      final recordId =
          await into(trainingRecords).insert(
        TrainingRecordsCompanion.insert(
          completedAt: completedAt,
          strengthGained:
              Value(strengthGained),
          enduranceGained:
              Value(enduranceGained),
          energyGained:
              Value(energyGained),
          staminaGained:
              Value(staminaGained),
        ),
      );

      // --------------------------------------------------
      // EXERCISES
      // --------------------------------------------------

      for (final exercise in exercises) {
        await into(trainingRecordExercises).insert(
          TrainingRecordExercisesCompanion.insert(
            trainingRecordId: recordId,
            exerciseId: exercise.exerciseId,
            variantIndex: exercise.variantIndex,
            sets: Value(exercise.sets),
            amount: exercise.amount,
            unit: exercise.unit,
          ),
        );
      }

      return recordId;
    });
  }

  Future<List<TrainingRecordRow>>
      getRecentTrainingRecords({
    int limit = 10,
  }) {
    return (select(trainingRecords)
          ..orderBy([
            (table) => OrderingTerm(
                  expression: table.completedAt,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(limit))
        .get();
  }

  Future<List<TrainingRecordExerciseRow>>
      getTrainingRecordExercises(
    int trainingRecordId,
  ) {
    return (select(trainingRecordExercises)
          ..where(
            (table) =>
                table.trainingRecordId.equals(
              trainingRecordId,
            ),
          ))
        .get();
  }

  Future<TrainingRecord?> getTrainingRecord(
    int id,
  ) async {
    final record =
        await (select(trainingRecords)
              ..where(
                (table) => table.id.equals(id),
              ))
            .getSingleOrNull();

    if (record == null) {
      return null;
    }

    final exerciseRows =
        await getTrainingRecordExercises(id);

    return TrainingRecord(
      id: record.id,
      completedAt: record.completedAt,
      strengthGained: record.strengthGained,
      enduranceGained: record.enduranceGained,
      energyGained: record.energyGained,
      staminaGained: record.staminaGained,
      exercises: exerciseRows
          .map(
            (exercise) => TrainingRecordExercise(
              id: exercise.id,
              trainingRecordId:
                  exercise.trainingRecordId,
              exerciseId: exercise.exerciseId,
              variantIndex: exercise.variantIndex,
              sets: exercise.sets,
              amount: exercise.amount,
              unit: exercise.unit,
            ),
          )
          .toList(),
    );
  }

  Future<List<TrainingRecord>>
      getRecentTrainingHistory({
    int limit = 10,
  }) async {
    final records =
        await getRecentTrainingRecords(
      limit: limit,
    );

    final result = <TrainingRecord>[];

    for (final record in records) {
      final trainingRecord =
          await getTrainingRecord(record.id);

      if (trainingRecord != null) {
        result.add(trainingRecord);
      }
    }

    return result;
  }
}
