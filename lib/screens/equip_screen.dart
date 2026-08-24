import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/equipment_slot.dart';
import '../models/equipment_slot.dart' as model;
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';

class EquipScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;

  const EquipScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
  });

  @override
  State<EquipScreen> createState() => _EquipScreenState();
}

class _EquipScreenState extends State<EquipScreen> {
  Timer? _cooldownTimer;

  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  @override
  void initState() {
    super.initState();

    _cooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
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

  Widget equipmentCard({
    required String label,
    required IconData icon,
    required model.EquipmentSlot slot,
  }) {
    final trainingPlan = trainingPlanManager.trainingPlan;
    final items = trainingPlan.itemsForSlot(slot);
    final isActive = trainingPlan.isSlotActive(slot);

    final item = items.isNotEmpty ? items.first : null;

    final isOnCooldown =
        item != null && trainingPlan.isOnCooldown(item);

    final cooldownRemaining = item != null
        ? trainingPlan.cooldownUntil(item)?.difference(DateTime.now())
        : null;

    final exercises = items
        .expand((item) => item.exercises)
        .map((equipmentExercise) => equipmentExercise.exercise.name)
        .toList();

    return EquipmentSlot(
      label: label,
      icon: icon,
      exercises: exercises,
      isActive: isActive,
      isOnCooldown: isOnCooldown,
      cooldownRemaining: cooldownRemaining,
      onPressed: () async {
        trainingPlan.toggleSlot(slot);

        await trainingPlanManager.saveTrainingPlan();

        if (!mounted) {
          return;
        }

        setState(() {});
      },
      width: double.infinity,
      height: 75,
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final trainingPlan = trainingPlanManager.trainingPlan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EQUIP'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
        child: Column(
          children: [
            const Text(
              'TRAINING PLAN',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 4,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 5),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.0,
              children: [
                equipmentCard(
                  label: 'SHOULDERS',
                  icon: Icons.accessibility_new,
                  slot: model.EquipmentSlot.shoulders,
                ),
                equipmentCard(
                  label: 'HEAD',
                  icon: Icons.air,
                  slot: model.EquipmentSlot.head,
                ),
                equipmentCard(
                  label: 'WINGS',
                  icon: Icons.flutter_dash,
                  slot: model.EquipmentSlot.wings,
                ),
                equipmentCard(
                  label: 'WEAPON',
                  icon: Icons.sports_martial_arts,
                  slot: model.EquipmentSlot.weapon,
                ),
                equipmentCard(
                  label: 'CHEST',
                  icon: Icons.shield,
                  slot: model.EquipmentSlot.chest,
                ),
                equipmentCard(
                  label: 'SHIELD',
                  icon: Icons.security,
                  slot: model.EquipmentSlot.shield,
                ),
                equipmentCard(
                  label: 'ACCESSORY',
                  icon: Icons.auto_awesome,
                  slot: model.EquipmentSlot.accessory,
                ),
                equipmentCard(
                  label: 'LEGS',
                  icon: Icons.directions_run,
                  slot: model.EquipmentSlot.legs,
                ),
                equipmentCard(
                  label: 'BELT',
                  icon: Icons.horizontal_rule,
                  slot: model.EquipmentSlot.belt,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final gainedStats = trainingPlan.execute(player);

                  if (gainedStats.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No training selected.'),
                      ),
                    );
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.flash_on, size: 26),
                label: const Text(
                  'EXECUTE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
