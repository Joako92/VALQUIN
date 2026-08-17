import 'package:flutter/material.dart';

import '../data/equipment_items.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../widgets/inventory_filter.dart';
import '../widgets/equipment_item.dart';
import '../data/training_plan.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  EquipmentSlot? selectedSlot;

  String formatAmount(double amount) {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }

    return amount.toString();
  }

  // --------------------------------------------------
  // FILTERED ITEMS
  // --------------------------------------------------

  List<EquipmentItem> get filteredItems {
    if (selectedSlot == null) {
      return equipmentItems;
    }

    return equipmentItems
        .where((item) => item.slot == selectedSlot)
        .toList();
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
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
                  selected: selectedSlot == null,
                  onSelected: () {
                    setState(() {
                      selectedSlot = null;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'HEAD',
                  selected: selectedSlot == EquipmentSlot.head,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.head;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'CHEST',
                  selected: selectedSlot == EquipmentSlot.chest,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.chest;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'BELT',
                  selected: selectedSlot == EquipmentSlot.belt,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.belt;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'SHOULDERS',
                  selected: selectedSlot == EquipmentSlot.shoulders,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.shoulders;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'BICEPS',
                  selected: selectedSlot == EquipmentSlot.biceps,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.biceps;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'TRICEPS',
                  selected: selectedSlot == EquipmentSlot.triceps,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.triceps;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'LEGS',
                  selected: selectedSlot == EquipmentSlot.legs,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.legs;
                    });
                  },
                ),

                InventoryFilter(
                  label: 'WINGS',
                  selected: selectedSlot == EquipmentSlot.wings,
                  onSelected: () {
                    setState(() {
                      selectedSlot = EquipmentSlot.wings;
                    });
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

                return EquipmentItemWidget(
                  name: item.name,

                  rarity: item.rarity.name.toUpperCase(),

                  slot: item.slot.name.toUpperCase(),

                  exercises: item.exercises
                    .map((exercise) {
                      final amount = formatAmount(exercise.amount);

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

                  onPressed: () {
                    setState(() {
                      if (isEquipped) {
                        final removed = trainingPlan.removeItem(item);

                        if (removed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'UNEQUIPPED ${item.name}',
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${item.name} IS ON COOLDOWN',
                              ),
                            ),
                          );
                        }
                      } else {
                        final result = trainingPlan.addItem(item);

                        switch (result.type) {
                          case EquipResultType.equipped:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'EQUIPPED ${item.name}',
                                ),
                              ),
                            );
                            break;

                          case EquipResultType.replaced:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'REPLACED ${result.item!.name} -> ${item.name}',
                                ),
                              ),
                            );
                            break;

                          case EquipResultType.blockedByCooldown:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${result.item!.name} IS ON COOLDOWN',
                                ),
                              ),
                            );
                            break;
                        }
                      }
                    });
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