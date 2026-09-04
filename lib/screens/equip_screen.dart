import 'dart:async';

import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart' as model;
import '../models/exercise.dart';

import '../widgets/valquin_icon.dart';
import '../widgets/valquin_icon_glow.dart';

class EquipScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppDatabase database;

  const EquipScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.database,
  });

  @override
  State<EquipScreen> createState() => _EquipScreenState();
}

class _EquipScreenState extends State<EquipScreen> {
  Timer? _cooldownTimer;

  /// Selected variant for each equipped item.
  ///
  /// The value is zero-based:
  /// 0 = variant 1
  /// 1 = variant 2
  /// 2 = variant 3
  final Map<String, int> selectedVariants = {};

  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppDatabase get database => widget.database;

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
    return selectedVariants[item.id] ?? 0;
  }

  void selectVariant(
    EquipmentItem item,
    int variantIndex,
  ) {
    setState(() {
      selectedVariants[item.id] = variantIndex;
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

  String formatVariant(ExerciseVariant variant) {
    final amount = formatAmount(variant.amount);

    if (variant.sets != null) {
      return '${variant.sets} x $amount ${variant.unit}';
    }

    return '$amount ${variant.unit}';
  }

  Widget buildVariantSelector(EquipmentItem item) {
    final selectedVariant = selectedVariantFor(item);
    final variantCount = availableVariantCount(item);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int variantIndex = 0;
            variantIndex < variantCount;
            variantIndex++)
          GestureDetector(
            onTap: () {
              selectVariant(item, variantIndex);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              child: Text(
                variantIndex == selectedVariant
                    ? '[${variantIndex + 1}]'
                    : '${variantIndex + 1}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      variantIndex == selectedVariant
                          ? FontWeight.bold
                          : FontWeight.normal,
                  color: variantIndex == selectedVariant
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // DAILY PLAN
  // ---------------------------------------------------------------------------

  Future<List<String>> getDailyExercises() async {
    final exercises = await database.getExercisesWithVariants();
    final trainingPlan = trainingPlanManager.trainingPlan;

    final activeSlots = model.EquipmentSlot.values.where(
      trainingPlan.isSlotActive,
    );

    final dailyExercises = <String>[];

    for (final slot in activeSlots) {
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

        final variantIndex = selectedVariant <=
                equipmentExercise.maxVariant
            ? selectedVariant
            : equipmentExercise.maxVariant;

        final variant = exercise.getVariant(
          variantIndex,
        );

        dailyExercises.add(
          '${exercise.name} — ${formatVariant(variant)}',
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
    return slot.name.toUpperCase();
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
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ITEM ICON
                    if (item == null)
                      slotIcon(
                        slot,
                        size: 60,
                        color: AppColors.textDisabled,
                      )
                    else
                      ValquinIconGlow(
                        asset: slotIconAsset(slot),
                        size: 60,
                        color: rarityColorValue,
                        glowColor: rarityGlow,
                        glowOpacity: isActive ? 0.8 : 0.0,
                        blur: 8,
                      ),

                    const SizedBox(height: 5),

                    // ITEM NAME / SLOT NAME
                    Text(
                      item?.name ?? slotLabel(slot),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
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
                      buildVariantSelector(item),
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
                        const Text(
                          'COOLDOWN',
                          style: TextStyle(
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
    return FutureBuilder<List<String>>(
      future: getDailyExercises(),
      builder: (context, snapshot) {
        final exercises = snapshot.data ?? [];

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
              const Text(
                'DAILY EXERCISES',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 12),

              if (exercises.isEmpty)
                const Text(
                  'No training selected.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textDisabled,
                  ),
                )
              else
                ...exercises.map(
                  (exercise) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '•',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            exercise,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textPrimary,
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

    final trainingPlan = trainingPlanManager.trainingPlan;

    final gainedStats = trainingPlan.execute(player);

    if (gainedStats.isEmpty) {
      return;
    }

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
          'TRAINING EXECUTED!\n$messages',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // BUILD
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.accent,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
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
                  // DAILY EXERCISES
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
              child: FloatingActionButton(
                heroTag: 'executeTraining',
                onPressed: executeTraining,
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.textPrimary,
                child: const Icon(
                  AppIcons.experience,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
