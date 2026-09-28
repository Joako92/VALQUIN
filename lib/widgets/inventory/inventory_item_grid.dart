import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../config/app_settings.dart';
import '../../config/equipment_visual_config.dart';

import '../../models/equipment_item.dart';

import '../../managers/training_plan_manager.dart';

import 'inventory_grid_item.dart';

class InventoryItemGrid extends StatelessWidget {
  final List<EquipmentItem> items;
  final TrainingPlanManager trainingPlanManager;
  final EquipmentItem? selectedItem;
  final AppSettings settings;

  final Duration? Function(EquipmentItem) cooldownRemaining;
  final bool Function(EquipmentItem) isOnCooldown;

  final ValueChanged<EquipmentItem> onItemSelected;
  final String cooldownLabel;

  const InventoryItemGrid({
    super.key,
    required this.items,
    required this.trainingPlanManager,
    required this.selectedItem,
    required this.settings,
    required this.cooldownRemaining,
    required this.isOnCooldown,
    required this.onItemSelected,
    required this.cooldownLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          settings.strings.noItems,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        8,
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.82,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return InventoryGridItem(
          item: item,
          isSelected: selectedItem == item,
          isEquipped: trainingPlanManager.trainingPlan
              .containsItem(item),
          isOnCooldown: isOnCooldown(item),
          rarity: rarityColor(item.rarity),
          glow: rarityGlowColor(item.rarity),
          slotIconAsset: equipmentSlotIcon,
          cooldownRemaining: cooldownRemaining(item),
          onTap: () => onItemSelected(item),
          cooldownLabel: cooldownLabel,
        );
      },
    );
  }
}