import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/equipment_slot.dart';
import '../data/training_plan.dart';
import '../models/equipment_slot.dart' as model;
import '../data/player.dart';

class EquipScreen extends StatefulWidget {
  const EquipScreen({super.key});

  @override
  State<EquipScreen> createState() => _EquipScreenState();
}

class _EquipScreenState extends State<EquipScreen> {
  Timer? _cooldownTimer;

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
          setState(() {});
        }
      },
    );
  }

  // --------------------------------------------------
  // DISPOSE
  // --------------------------------------------------

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  // --------------------------------------------------
  // EQUIPMENT CARD
  // --------------------------------------------------

  Widget equipmentCard({
    required String label,
    required IconData icon,
    required model.EquipmentSlot slot,
  }) {
    final items = trainingPlan.itemsForSlot(slot);

    final isActive = trainingPlan.isSlotActive(slot);

    // --------------------------------------------------
    // EQUIPPED ITEM
    // --------------------------------------------------

    final item = items.isNotEmpty
        ? items.first
        : null;

    // --------------------------------------------------
    // COOLDOWN
    // --------------------------------------------------

    final isOnCooldown =
        item != null && trainingPlan.isOnCooldown(item);

    final cooldownRemaining = item != null
        ? trainingPlan
            .cooldownUntil(item)
            ?.difference(DateTime.now())
        : null;

    // --------------------------------------------------
    // EXERCISES
    // --------------------------------------------------

    final exercises = items
        .expand((item) => item.exercises)
        .map((exercise) => exercise.name)
        .toList();

    // --------------------------------------------------
    // SLOT
    // --------------------------------------------------

    return EquipmentSlot(
      label: label,
      icon: icon,

      exercises: exercises,

      isActive: isActive,

      isOnCooldown: isOnCooldown,

      cooldownRemaining: cooldownRemaining,

      onPressed: () {
        setState(() {
          trainingPlan.toggleSlot(slot);
        });
      },

      width: double.infinity,
      height: 75,
    );
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EQUIP'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          15,
          10,
          15,
          20,
        ),

        child: Column(
          children: [
            // --------------------------------------------------
            // TITLE
            // --------------------------------------------------

            const Text(
              'TRAINING PLAN',

              style: TextStyle(
                fontSize: 14,
                letterSpacing: 4,
                color: Colors.white54,
              ),
            ),

            const SizedBox(height: 5),

            // --------------------------------------------------
            // EQUIPMENT SLOTS
            // --------------------------------------------------

            GridView.count(
              crossAxisCount: 2,

              crossAxisSpacing: 6,
              mainAxisSpacing: 6,

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              childAspectRatio: 1.30,

              children: [
                equipmentCard(
                  label: 'HEAD',
                  icon: Icons.air,
                  slot: model.EquipmentSlot.head,
                ),

                equipmentCard(
                  label: 'SHOULDERS',
                  icon: Icons.accessibility_new,
                  slot: model.EquipmentSlot.shoulders,
                ),

                equipmentCard(
                  label: 'CHEST',
                  icon: Icons.shield,
                  slot: model.EquipmentSlot.chest,
                ),

                equipmentCard(
                  label: 'WINGS',
                  icon: Icons.flutter_dash,
                  slot: model.EquipmentSlot.wings,
                ),

                equipmentCard(
                  label: 'BICEPS',
                  icon: Icons.fitness_center,
                  slot: model.EquipmentSlot.biceps,
                ),

                equipmentCard(
                  label: 'TRICEPS',
                  icon: Icons.fitness_center,
                  slot: model.EquipmentSlot.triceps,
                ),

                equipmentCard(
                  label: 'BELT',
                  icon: Icons.horizontal_rule,
                  slot: model.EquipmentSlot.belt,
                ),

                equipmentCard(
                  label: 'LEGS',
                  icon: Icons.directions_run,
                  slot: model.EquipmentSlot.legs,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // --------------------------------------------------
            // EXECUTE
            // --------------------------------------------------

            SizedBox(
              width: double.infinity,
              height: 40,

              child: ElevatedButton.icon(
                onPressed: () {
                  final gainedStats = trainingPlan.execute(player);

                  setState(() {});

                  if (gainedStats.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'No training selected.',
                        ),
                      ),
                    );

                    return;
                  }

                  final messages = gainedStats.entries
                      .map((entry) {
                        final statName =
                            entry.key.toUpperCase();

                        final value = entry.value;

                        return '+$value $statName';
                      })
                      .join('\n');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'TRAINING EXECUTED!\n$messages',

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      duration: const Duration(
                        seconds: 2,
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.flash_on,
                  size: 26,
                ),

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