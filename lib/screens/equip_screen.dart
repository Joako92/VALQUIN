import 'dart:async';

import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../models/equipment_slot.dart' as model;
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';

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

  Future<List<String>> getDailyExerciseNames() async {
    final exercises = await database.getExercisesWithVariants();
    final trainingPlan = trainingPlanManager.trainingPlan;

    final activeSlots = model.EquipmentSlot.values.where(
      trainingPlan.isSlotActive,
    );

    final exerciseNames = <String>[];

    for (final slot in activeSlots) {
      final items = trainingPlan.itemsForSlot(slot);

      if (items.isEmpty) {
        continue;
      }

      final item = items.first;

      if (trainingPlan.isOnCooldown(item)) {
        continue;
      }

      for (final equipmentExercise in item.exercises) {
        final exercise = exercises.firstWhere(
          (exercise) =>
              exercise.id == equipmentExercise.exerciseId,
        );

        exerciseNames.add(exercise.name);
      }
    }

    return exerciseNames;
  }

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

  IconData slotIcon(model.EquipmentSlot slot) {
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

  String slotLabel(model.EquipmentSlot slot) {
    return slot.name.toUpperCase();
  }

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
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: rarityGlow.withValues(alpha: 0.65),
                    blurRadius: 14,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      slotIcon(slot),
                      size: 38,
                      color: item == null
                          ? AppColors.textDisabled
                          : rarityColorValue,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item?.name ?? slotLabel(slot),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: item == null
                            ? AppColors.textDisabled
                            : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (isOnCooldown)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.55),
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
                                ?.difference(DateTime.now()),
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

  Widget dailyPlan() {
    return FutureBuilder<List<String>>(
      future: getDailyExerciseNames(),
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

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.accent,),
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

                  dailyPlan(),
                ],
              ),
            ),

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
