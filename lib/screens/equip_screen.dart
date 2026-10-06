import 'dart:async';

import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart' as model;
import '../models/exercise_variant.dart';
import '../models/variant_family.dart';
import '../models/muscle_group.dart';
import '../models/training_record_exercise.dart';

import '../widgets/valquin_icon.dart';
import '../widgets/valquin_icon_glow.dart';
import '../widgets/valquin_info_dialog.dart';
import '../widgets/inventory/inventory_variant_selector.dart';

class EquipScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppDatabase database;
  final AppSettings settings;

  const EquipScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.database,
    required this.settings,
  });

  @override
  State<EquipScreen> createState() => _EquipScreenState();
}

class _EquipScreenState extends State<EquipScreen> {
  Timer? _cooldownTimer;

  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppDatabase get database => widget.database;

  AppSettings get settings => widget.settings;

  // --------------------------------------------------
  // INIT
  // --------------------------------------------------

  @override
  void initState() {
    super.initState();

    _cooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
          _checkCooldowns();
          setState(() {});
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showEquipInfoIfNeeded();
    });
  }

  // --------------------------------------------------
  // INFO DIALOG
  // --------------------------------------------------

  void _showEquipInfoIfNeeded() {
    final player = playerManager.player;

    if (!mounted || player == null || player.xp != 0) {
      return;
    }

    showDialog(
      context: context,
      builder: (_) {
        return ValquinInfoDialog(
          title: settings.strings.equipInfoTitle,
          message: settings.strings.equipInfoMessage,
          buttonText: settings.strings.gotIt,
        );
      },
    );
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // COOLDOWN
  // ---------------------------------------------------------------------------

  String _formatCooldown(Duration? duration) {
    if (duration == null || duration.isNegative) {
      return '00:00';
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _checkCooldowns() async {
    final trainingPlan = trainingPlanManager.trainingPlan;

    bool changed = false;

    for (final slot in model.EquipmentSlot.values) {
      final items = trainingPlan.itemsForSlot(slot);

      if (items.isEmpty) {
        continue;
      }

      final item = items.first;

      if (trainingPlan.isSlotActive(slot) &&
          trainingPlan.isOnCooldown(item)) {
        trainingPlan.deactivateSlot(slot);
        changed = true;
      }
    }

    if (changed) {
      await trainingPlanManager.saveTrainingPlan();
    }
  }

  // ---------------------------------------------------------------------------
  // VARIANTS
  // ---------------------------------------------------------------------------

  int selectedVariantFor(EquipmentItem item) {
    return trainingPlanManager.trainingPlan
        .selectedVariantFor(item);
  }

  void selectVariant(
    EquipmentItem item,
    int variantIndex,
  ) {
    setState(() {
      trainingPlanManager.trainingPlan.selectVariant(
        item,
        variantIndex,
      );
    });
  }

  /// Returns the number of variants safely available for the item.
  ///
  /// The selector exposes only variants supported by all exercises
  /// contained in the equipment item.
  int availableVariantCount(EquipmentItem item) {
    if (item.exercises.isEmpty) {
      return 1;
    }

    return item.exercises
            .map((exercise) => exercise.maxVariant)
            .reduce(
              (current, value) =>
                  value < current ? value : current,
            ) +
        1;
  }

  String formatAmount(double amount) {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }

    return amount.toString();
  }

  String formatVariant(
    ExerciseVariant variant,
    VariantFamily family,
  ) {
    final amount = formatAmount(variant.amount);

    if (variant.sets != null) {
      return '${variant.sets} x $amount ${family.unit}';
    }

    return '$amount ${family.unit}';
  }

  // ---------------------------------------------------------------------------
  // DAILY PLAN
  // ---------------------------------------------------------------------------

  Future<Map<MuscleGroup, List<String>>> getDailyExercises() async {
    final exercises =
        await database.select(database.exercises).get();

    final variantFamilies =
        await database.getVariantFamiliesWithVariants();

    final trainingPlan = trainingPlanManager.trainingPlan;

    final activeSlots = model.EquipmentSlot.values.where(
      trainingPlan.isSlotActive,
    );

    final dailyExercises = <MuscleGroup, List<String>>{};

    for (final slot in activeSlots) {
      final muscleGroup = MuscleGroup.fromSlot(slot);

      // Slots without a muscle group do not contribute
      // exercises to the daily mission.
      if (muscleGroup == null) {
        continue;
      }

      final items = trainingPlan.itemsForSlot(slot);

      if (items.isEmpty) {
        continue;
      }

      final item = items.first;

      if (trainingPlan.isOnCooldown(item)) {
        continue;
      }

      final selectedVariant = selectedVariantFor(item);

      for (final equipmentExercise in item.exercises) {
        final exercise = exercises.firstWhere(
          (exercise) =>
              exercise.id == equipmentExercise.exerciseId,
        );

        final family = variantFamilies.firstWhere(
          (family) =>
              family.id == equipmentExercise.variantFamilyId,
        );

        if (family.variants.isEmpty) {
          continue;
        }

        final variantIndex = selectedVariant <=
                equipmentExercise.maxVariant
            ? selectedVariant
            : equipmentExercise.maxVariant;

        final variant = family.variants.firstWhere(
          (variant) => variant.index == variantIndex,
          orElse: () => family.variants.last,
        );

        dailyExercises.putIfAbsent(
          muscleGroup,
          () => [],
        );

        dailyExercises[muscleGroup]!.add(
          '${exercise.name} — ${formatVariant(variant, family)}',
        );
      }
    }

    return dailyExercises;
  }

  // ---------------------------------------------------------------------------
  // COLORS / ICONS
  // ---------------------------------------------------------------------------

  Color rarityColor(String rarity) {
    switch (rarity.toLowerCase()) {
      case 'rare':
        return AppColors.rare;

      case 'legendary':
        return AppColors.legendary;

      case 'mythic':
        return AppColors.mythic;

      case 'common':
      default:
        return AppColors.common;
    }
  }

  Color rarityGlowColor(String rarity) {
    switch (rarity.toLowerCase()) {
      case 'rare':
        return AppColors.rareGlow;

      case 'legendary':
        return AppColors.legendaryGlow;

      case 'mythic':
        return AppColors.mythicGlow;

      case 'common':
      default:
        return AppColors.commonGlow;
    }
  }

  String slotIconAsset(model.EquipmentSlot slot) {
    switch (slot) {
      case model.EquipmentSlot.shoulders:
        return AppIcons.shoulders;

      case model.EquipmentSlot.head:
        return AppIcons.head;

      case model.EquipmentSlot.wings:
        return AppIcons.wings;

      case model.EquipmentSlot.weapon:
        return AppIcons.weapon;

      case model.EquipmentSlot.chest:
        return AppIcons.chest;

      case model.EquipmentSlot.shield:
        return AppIcons.shield;

      case model.EquipmentSlot.accessory:
        return AppIcons.accessory;

      case model.EquipmentSlot.legs:
        return AppIcons.legs;

      case model.EquipmentSlot.belt:
        return AppIcons.belt;
    }
  }

  Widget slotIcon(
    model.EquipmentSlot slot, {
    double size = 38,
    Color? color,
  }) {
    return ValquinIcon(
      slotIconAsset(slot),
      size: size,
      color: color,
    );
  }

  String slotLabel(model.EquipmentSlot slot) {
    switch (slot) {
      case model.EquipmentSlot.shoulders:
        return settings.strings.shoulders;

      case model.EquipmentSlot.head:
        return settings.strings.head;

      case model.EquipmentSlot.wings:
        return settings.strings.wings;

      case model.EquipmentSlot.weapon:
        return settings.strings.weapon;

      case model.EquipmentSlot.chest:
        return settings.strings.chest;

      case model.EquipmentSlot.shield:
        return settings.strings.shield;

      case model.EquipmentSlot.accessory:
        return settings.strings.accessory;

      case model.EquipmentSlot.legs:
        return settings.strings.legs;

      case model.EquipmentSlot.belt:
        return settings.strings.belt;
    }
  }

  String muscleGroupLabel(MuscleGroup group) {
    switch (group) {
      case MuscleGroup.shoulders:
        return settings.strings.muscleGroupShoulders;

      case MuscleGroup.cardio:
        return settings.strings.muscleGroupCardio;

      case MuscleGroup.back:
        return settings.strings.muscleGroupBack;

      case MuscleGroup.biceps:
        return settings.strings.muscleGroupBiceps;

      case MuscleGroup.chest:
        return settings.strings.muscleGroupChest;

      case MuscleGroup.triceps:
        return settings.strings.muscleGroupTriceps;

      case MuscleGroup.legs:
        return settings.strings.muscleGroupLegs;

      case MuscleGroup.core:
        return settings.strings.muscleGroupCore;
    }
  }

  // ---------------------------------------------------------------------------
  // EQUIPMENT CARD
  // ---------------------------------------------------------------------------

  Widget equipmentCard({
    required model.EquipmentSlot slot,
  }) {
    final trainingPlan = trainingPlanManager.trainingPlan;

    final items = trainingPlan.itemsForSlot(slot);
    final item = items.isNotEmpty ? items.first : null;

    final isActive =
        item != null && trainingPlan.isSlotActive(slot);

    final isOnCooldown =
        item != null && trainingPlan.isOnCooldown(item);

    final rarity = item?.rarity.name ?? 'common';

    final rarityColorValue = rarityColor(rarity);
    final rarityGlow = rarityGlowColor(rarity);

    final borderColor = item == null
        ? AppColors.border
        : rarityColorValue;

    return GestureDetector(
      onTap: item == null || isOnCooldown
          ? null
          : () async {
              trainingPlan.toggleSlot(slot);

              await trainingPlanManager.saveTrainingPlan();

              if (!mounted) {
                return;
              }

              setState(() {});
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: isActive ? 2 : 1,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ITEM ICON

                    if (item == null)
                      slotIcon(
                        slot,
                        size: 42,
                        color: AppColors.textDisabled,
                      )
                    else
                      ValquinIconGlow(
                        asset: slotIconAsset(slot),
                        size: 42,
                        color: rarityColorValue,
                        glowColor: rarityGlow,
                        glowOpacity: isActive ? 0.8 : 0.0,
                        blur: 8,
                      ),

                    const SizedBox(height: 3),

                    // ITEM NAME / SLOT NAME

                    Text(
                      item?.name ?? slotLabel(slot),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                        color: item == null
                            ? AppColors.textDisabled
                            : AppColors.textPrimary,
                      ),
                    ),

                    // VARIANTS

                    if (item != null) ...[
                      const SizedBox(height: 2),
                      InventoryVariantSelector(
                        item: item,
                        selectedVariantFor: selectedVariantFor,
                        availableVariantCount: availableVariantCount,
                        onVariantSelected: selectVariant,
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // -----------------------------------------------------------------
            // COOLDOWN
            // -----------------------------------------------------------------

            if (isOnCooldown)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(
                      alpha: 0.55,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          settings.strings.cooldown,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: AppColors.textSecondary,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          _formatCooldown(
                            trainingPlan
                                .cooldownUntil(item)
                                ?.difference(
                                  DateTime.now(),
                                ),
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // DAILY PLAN UI
  // ---------------------------------------------------------------------------

  Widget dailyPlan() {
    return FutureBuilder<Map<MuscleGroup, List<String>>>(
      future: getDailyExercises(),
      builder: (context, snapshot) {
        final exerciseGroups = snapshot.data ?? {};

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settings.strings.dailyMission,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 12),

              if (exerciseGroups.isEmpty)
                Text(
                  settings.strings.noTrainingSelected,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textDisabled,
                  ),
                )
              else
                ...exerciseGroups.entries.map(
                  (group) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${muscleGroupLabel(group.key)}:',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: AppColors.textSecondary,
                          ),
                        ),

                        const SizedBox(height: 5),

                        ...group.value.map(
                          (exercise) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 4,
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '•',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        AppColors.textSecondary,
                                  ),
                                ),

                                const SizedBox(width: 8),

                                Expanded(
                                  child: Text(
                                    exercise,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color:
                                          AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // EXECUTE
  // ---------------------------------------------------------------------------

  Future<void> executeTraining() async {
    final player = playerManager.player;

    if (player == null) {
      return;
    }

    final previousLevel = player.level;

    final trainingPlan = trainingPlanManager.trainingPlan;

    final readyItems = trainingPlan.readyItems();

    final gainedStats = trainingPlan.execute(player);

    if (gainedStats.isEmpty) {
      return;
    }

    final exercises =
        await database.select(database.exercises).get();

    final variantFamilies =
        await database.getVariantFamiliesWithVariants();

    final recordExercises = <TrainingRecordExercise>[];

    for (final item in readyItems) {
      for (final equipmentExercise in item.exercises) {
        final exercise = exercises.firstWhere(
          (exercise) =>
              exercise.id == equipmentExercise.exerciseId,
        );

        final family = variantFamilies.firstWhere(
          (family) =>
              family.id == equipmentExercise.variantFamilyId,
        );

        if (family.variants.isEmpty) {
          continue;
        }

        final variantIndex =
            trainingPlan.resolvedVariantFor(
          item,
          equipmentExercise.maxVariant,
        );

        final variant = family.variants.firstWhere(
          (variant) => variant.index == variantIndex,
          orElse: () => family.variants.last,
        );

        recordExercises.add(
          TrainingRecordExercise(
            trainingRecordId: 0,
            exerciseId: exercise.id,
            variantIndex: variant.index,
            sets: variant.sets,
            amount: variant.amount,
            unit: family.unit,
          ),
        );
      }
    }

    await database.insertTrainingRecord(
      completedAt: DateTime.now(),
      strengthGained: gainedStats['strength'] ?? 0,
      enduranceGained: gainedStats['endurance'] ?? 0,
      energyGained: gainedStats['energy'] ?? 0,
      staminaGained: gainedStats['stamina'] ?? 0,
      exercises: recordExercises,
    );

    final leveledUp = player.level > previousLevel;

    await playerManager.savePlayer();
    await trainingPlanManager.saveTrainingPlan();

    if (!mounted) {
      return;
    }

    setState(() {});

    final messages = gainedStats.entries.map((entry) {
      final statName = entry.key.toUpperCase();
      final value = entry.value;

      return '+$value $statName';
    }).join('\n');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.surface,
        content: Text(
          '${settings.strings.trainingExecuted}\n$messages',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    if (leveledUp) {
      await showDialog(
        context: context,
        builder: (_) {
          return ValquinInfoDialog(
            title: settings.strings.levelUpTitle,
            message: settings.strings.levelUpMessage,
            buttonText: settings.strings.gotIt,
          );
        },
      );
    }
  }

  // ---------------------------------------------------------------------------
  // BUILD
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                15,
                15,
                15,
                110,
              ),
              child: Column(
                children: [
                  // -----------------------------------------------------------
                  // EQUIPMENT GRID
                  // -----------------------------------------------------------

                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.0,
                    children: [
                      equipmentCard(
                        slot: model.EquipmentSlot.shoulders,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.head,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.wings,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.weapon,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.chest,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.shield,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.accessory,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.legs,
                      ),
                      equipmentCard(
                        slot: model.EquipmentSlot.belt,
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // -----------------------------------------------------------
                  // DAILY MISSION
                  // -----------------------------------------------------------

                  dailyPlan(),
                ],
              ),
            ),

            // ---------------------------------------------------------------
            // EXECUTE BUTTON
            // ---------------------------------------------------------------

            Positioned(
              right: 18,
              bottom: 18,
              child: FloatingActionButton.extended(
                heroTag: 'executeTraining',
                onPressed: executeTraining,
                backgroundColor:
                    Theme.of(context).colorScheme.primary,
                foregroundColor: AppColors.textPrimary,
                label: Text(
                  settings.strings.execute,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                icon: const Icon(
                  AppIcons.experience,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
