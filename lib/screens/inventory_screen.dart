import 'package:flutter/material.dart';

import '../data/equipment_items.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../widgets/inventory_filter.dart';
import '../widgets/equipment_item.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../models/training_plan.dart';

enum InventoryFilterType {
  all,
  equipped,
  slot,
}

class InventoryScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;

  const InventoryScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
  });

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // --------------------------------------------------
  // MANAGERS
  // --------------------------------------------------

  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  // --------------------------------------------------
  // FORMAT REQUIREMENT
  // --------------------------------------------------

  String formatEquipRequirement(EquipmentItem item) {
    final requirements = item.equipRequirements;
    final parts = <String>[];

    if (requirements.level != null) {
      parts.add('LEVEL: ${requirements.level}');
    }

    requirements.stats.forEach((stat, value) {
      parts.add('${stat.toUpperCase()}: $value');
    });

    if (parts.isEmpty) {
      return 'NONE';
    }

    return parts.join(' • ');
  }

  // --------------------------------------------------
  // FILTER
  // --------------------------------------------------

  InventoryFilterType selectedFilter =
      InventoryFilterType.all;

  EquipmentSlot? selectedSlot;

  // --------------------------------------------------
  // FORMAT
  // --------------------------------------------------

  String formatAmount(double amount) {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }

    return amount.toString();
  }

  // --------------------------------------------------
  // UNLOCKED ITEMS
  // --------------------------------------------------

  List<EquipmentItem> get unlockedItems {
    final player = playerManager.player;

    if (player == null) {
      return [];
    }

    return equipmentItems
        .where(
          (item) => trainingPlanManager.trainingPlan
              .isItemUnlocked(item, player),
        )
        .toList();
  }

  // --------------------------------------------------
  // FILTERED ITEMS
  // --------------------------------------------------

  List<EquipmentItem> get filteredItems {
    final trainingPlan =
        trainingPlanManager.trainingPlan;

    switch (selectedFilter) {
      case InventoryFilterType.all:
        return unlockedItems;

      case InventoryFilterType.equipped:
        return unlockedItems
            .where(
              (item) => trainingPlan.containsItem(item),
            )
            .toList();

      case InventoryFilterType.slot:
        return unlockedItems
            .where(
              (item) => item.slot == selectedSlot,
            )
            .toList();
    }
  }

  // --------------------------------------------------
  // SELECT FILTER
  // --------------------------------------------------

  void selectAll() {
    setState(() {
      selectedFilter = InventoryFilterType.all;
      selectedSlot = null;
    });
  }

  void selectEquipped() {
    setState(() {
      selectedFilter = InventoryFilterType.equipped;
      selectedSlot = null;
    });
  }

  void selectSlot(EquipmentSlot slot) {
    setState(() {
      selectedFilter = InventoryFilterType.slot;
      selectedSlot = slot;
    });
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

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

    final trainingPlan =
        trainingPlanManager.trainingPlan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('INVENTORY'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        children: [
          // --------------------------------------------------
          // FILTERS
          // --------------------------------------------------

          SizedBox(
            height: 55,

            child: ListView(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              children: [
                InventoryFilter(
                  label: 'ALL',

                  selected:
                      selectedFilter ==
                          InventoryFilterType.all,

                  onSelected: selectAll,
                ),

                InventoryFilter(
                  label: 'EQUIPPED',

                  selected:
                      selectedFilter ==
                          InventoryFilterType.equipped,

                  onSelected: selectEquipped,
                ),

                InventoryFilter(
                  label: 'HEAD',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.head,

                  onSelected: () {
                    selectSlot(EquipmentSlot.head);
                  },
                ),

                InventoryFilter(
                  label: 'CHEST',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.chest,

                  onSelected: () {
                    selectSlot(EquipmentSlot.chest);
                  },
                ),

                InventoryFilter(
                  label: 'BELT',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.belt,

                  onSelected: () {
                    selectSlot(EquipmentSlot.belt);
                  },
                ),

                InventoryFilter(
                  label: 'SHOULDERS',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.shoulders,

                  onSelected: () {
                    selectSlot(
                      EquipmentSlot.shoulders,
                    );
                  },
                ),

                InventoryFilter(
                  label: 'BICEPS',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.biceps,

                  onSelected: () {
                    selectSlot(
                      EquipmentSlot.biceps,
                    );
                  },
                ),

                InventoryFilter(
                  label: 'TRICEPS',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.triceps,

                  onSelected: () {
                    selectSlot(
                      EquipmentSlot.triceps,
                    );
                  },
                ),

                InventoryFilter(
                  label: 'LEGS',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.legs,

                  onSelected: () {
                    selectSlot(
                      EquipmentSlot.legs,
                    );
                  },
                ),

                InventoryFilter(
                  label: 'WINGS',

                  selected:
                      selectedFilter ==
                              InventoryFilterType.slot &&
                          selectedSlot ==
                              EquipmentSlot.wings,

                  onSelected: () {
                    selectSlot(
                      EquipmentSlot.wings,
                    );
                  },
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // ITEMS
          // --------------------------------------------------

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                20,
              ),

              itemCount: filteredItems.length,

              itemBuilder: (context, index) {
                final item = filteredItems[index];

                final isEquipped =
                    trainingPlan.containsItem(item);

                final canEquip =
                    trainingPlan.canEquipItem(
                  item,
                  player,
                );

                return EquipmentItemWidget(
                  name: item.name,

                  rarity:
                      item.rarity.name.toUpperCase(),

                  slot:
                      item.slot.name.toUpperCase(),

                  exercises: item.exercises
                      .map((exercise) {
                        final amount =
                            formatAmount(
                              exercise.amount,
                            );

                        if (exercise.sets != null) {
                          return '${exercise.name} — '
                              '${exercise.sets} x '
                              '$amount ${exercise.unit}';
                        }

                        return '${exercise.name} — '
                            '$amount ${exercise.unit}';
                      })
                      .toList(),

                  equipped: isEquipped,
                  canEquip: canEquip,

                  equipRequirements:
                      formatEquipRequirement(item),

                  onPressed: () async {
                    // --------------------------------------------------
                    // UNEQUIP
                    // --------------------------------------------------

                    if (isEquipped) {
                      final removed =
                          trainingPlan.removeItem(item);

                      if (removed) {
                        await trainingPlanManager
                            .saveTrainingPlan();

                        setState(() {});

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'UNEQUIPPED ${item.name}',
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name} IS ON COOLDOWN',
                            ),
                          ),
                        );
                      }

                      return;
                    }

                    // --------------------------------------------------
                    // EQUIP
                    // --------------------------------------------------

                    final result =
                        trainingPlan.addItem(
                      item,
                      player,
                    );

                    switch (result.type) {
                      case EquipResultType.equipped:
                        await trainingPlanManager
                            .saveTrainingPlan();

                        setState(() {});

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'EQUIPPED ${item.name}',
                            ),
                          ),
                        );
                        break;

                      case EquipResultType.replaced:
                        await trainingPlanManager
                            .saveTrainingPlan();

                        setState(() {});

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              'REPLACED '
                              '${result.item!.name} -> '
                              '${item.name}',
                            ),
                          ),
                        );
                        break;

                      case EquipResultType.blockedByCooldown:
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              '${result.item!.name} IS ON COOLDOWN',
                            ),
                          ),
                        );
                        break;

                      case EquipResultType
                          .blockedByUnlockRequirement:
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name}: '
                              'UNLOCK REQUIREMENTS NOT MET',
                            ),
                          ),
                        );
                        break;

                      case EquipResultType
                          .blockedByEquipRequirement:
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name}: '
                              'EQUIP REQUIREMENTS NOT MET',
                            ),
                          ),
                        );
                        break;
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}