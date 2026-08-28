import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/training_plan.dart';
import '../models/exercise.dart';
import '../widgets/inventory_filter.dart';
import '../widgets/equipment_item.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';


enum InventoryFilterType { all, equipped, slot }

class InventoryScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppDatabase database;

  const InventoryScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.database,
  });

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppDatabase get database => widget.database;

  InventoryFilterType selectedFilter =
      InventoryFilterType.all;

  EquipmentSlot? selectedSlot;

  List<EquipmentItem> equipmentItems = [];

  Map<String, Exercise> exercisesById = {};

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEquipmentItems();
  }

  Future<void> loadEquipmentItems() async {
    final items =
        await database.getEquipmentItemsWithAllData();

    final exercises =
        await database.getExercisesWithVariants();

    if (!mounted) return;

    setState(() {
      equipmentItems = items;

      exercisesById = {
        for (final exercise in exercises)
          exercise.id: exercise,
      };

      isLoading = false;
    });
  }

  String formatEquipRequirement(EquipmentItem item) {
    final requirements = item.equipRequirements;
    final parts = <String>[];

    if (requirements.level != null) {
      parts.add('LEVEL: ${requirements.level}');
    }

    requirements.stats.forEach((stat, value) {
      parts.add('${stat.toUpperCase()}: $value');
    });

    return parts.isEmpty ? 'NONE' : parts.join(' • ');
  }

  String formatAmount(double amount) {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }

    return amount.toString();
  }

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

  List<EquipmentItem> get filteredItems {
    final trainingPlan =
        trainingPlanManager.trainingPlan;

    switch (selectedFilter) {
      case InventoryFilterType.all:
        return unlockedItems;

      case InventoryFilterType.equipped:
        return unlockedItems
            .where(
              (item) =>
                  trainingPlan.containsItem(item),
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

  void selectAll() {
    setState(() {
      selectedFilter = InventoryFilterType.all;
      selectedSlot = null;
    });
  }

  void selectEquipped() {
    setState(() {
      selectedFilter =
          InventoryFilterType.equipped;
      selectedSlot = null;
    });
  }

  void selectSlot(EquipmentSlot slot) {
    setState(() {
      selectedFilter =
          InventoryFilterType.slot;
      selectedSlot = slot;
    });
  }

  Widget slotFilter(
    String label,
    EquipmentSlot slot,
  ) {
    return InventoryFilter(
      label: label,
      selected:
          selectedFilter ==
                  InventoryFilterType.slot &&
              selectedSlot == slot,
      onSelected: () => selectSlot(slot),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null || isLoading) {
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
          SizedBox(
            height: 55,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.symmetric(
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
                slotFilter(
                  'SHOULDERS',
                  EquipmentSlot.shoulders,
                ),
                slotFilter(
                  'HEAD',
                  EquipmentSlot.head,
                ),
                slotFilter(
                  'WINGS',
                  EquipmentSlot.wings,
                ),
                slotFilter(
                  'WEAPON',
                  EquipmentSlot.weapon,
                ),
                slotFilter(
                  'CHEST',
                  EquipmentSlot.chest,
                ),
                slotFilter(
                  'SHIELD',
                  EquipmentSlot.shield,
                ),
                slotFilter(
                  'ACCESSORY',
                  EquipmentSlot.accessory,
                ),
                slotFilter(
                  'LEGS',
                  EquipmentSlot.legs,
                ),
                slotFilter(
                  'BELT',
                  EquipmentSlot.belt,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                20,
              ),
              itemCount: filteredItems.length,
              itemBuilder:
                  (context, index) {
                final item =
                    filteredItems[index];

                final isEquipped =
                    trainingPlan
                        .containsItem(item);

                final canEquip =
                    trainingPlan.canEquipItem(
                  item,
                  player,
                );

                return EquipmentItemWidget(
                  name: item.name,
                  rarity:
                      item.rarity.name
                          .toUpperCase(),
                  slot:
                      item.slot.name
                          .toUpperCase(),

                  exercises: item.exercises.map(
                    (equipmentExercise) {
                      final exercise =
                          exercisesById[equipmentExercise.exerciseId];

                      if (exercise == null) {
                        return 'UNKNOWN EXERCISE';
                      }

                      final variant = exercise.getVariant(
                        equipmentExercise.maxVariant,
                      );

                      final amount = formatAmount(
                        variant.amount,
                      );

                      if (variant.sets != null) {
                        return '${exercise.name} — '
                            '${variant.sets} x '
                            '$amount '
                            '${variant.unit}';
                      }

                      return '${exercise.name} — '
                          '$amount '
                          '${variant.unit}';
                    },
                  ).toList(),

                  equipped: isEquipped,
                  canEquip: canEquip,

                  equipRequirements:
                      formatEquipRequirement(
                    item,
                  ),

                  onPressed: () async {
                    if (isEquipped) {
                      final removed =
                          trainingPlan
                              .removeItem(item);

                      if (removed) {
                        await trainingPlanManager
                            .saveTrainingPlan();

                        if (!mounted) return;

                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'UNEQUIPPED ${item.name}',
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name} IS ON COOLDOWN',
                            ),
                          ),
                        );
                      }

                      return;
                    }

                    final result =
                        trainingPlan.addItem(
                      item,
                      player,
                    );

                    switch (result.type) {
                      case EquipResultType.equipped:
                        await trainingPlanManager
                            .saveTrainingPlan();

                        if (!mounted) return;

                        setState(() {});

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
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

                        if (!mounted) return;
                        
                        setState(() {});

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              'REPLACED '
                              '${result.item!.name} '
                              '-> ${item.name}',
                            ),
                          ),
                        );

                        break;

                      case EquipResultType.blockedByCooldown:
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${result.item!.name} '
                              'IS ON COOLDOWN',
                            ),
                          ),
                        );

                        break;

                      case EquipResultType
                          .blockedByUnlockRequirement:
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name}: '
                              'UNLOCK REQUIREMENTS '
                              'NOT MET',
                            ),
                          ),
                        );

                        break;

                      case EquipResultType
                          .blockedByEquipRequirement:
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${item.name}: '
                              'EQUIP REQUIREMENTS '
                              'NOT MET',
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