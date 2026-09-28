import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../config/app_settings.dart';
import '../../models/equipment_slot.dart';

enum InventoryFilterType {
  all,
  equipped,
  slot,
}

class InventoryFilterBar extends StatelessWidget {
  final InventoryFilterType selectedFilter;
  final EquipmentSlot? selectedSlot;
  final AppSettings settings;

  final VoidCallback onSelectAll;
  final VoidCallback onSelectEquipped;
  final ValueChanged<EquipmentSlot> onSelectSlot;

  const InventoryFilterBar({
    super.key,
    required this.selectedFilter,
    required this.selectedSlot,
    required this.settings,
    required this.onSelectAll,
    required this.onSelectEquipped,
    required this.onSelectSlot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        children: [
          _buildFilter(
            label: settings.strings.all,
            selected:
                selectedFilter == InventoryFilterType.all,
            onTap: onSelectAll,
          ),

          _buildFilter(
            label: settings.strings.equipped,
            selected:
                selectedFilter ==
                    InventoryFilterType.equipped,
            onTap: onSelectEquipped,
          ),

          _buildSlotFilter(
            label: settings.strings.shoulders,
            slot: EquipmentSlot.shoulders,
          ),

          _buildSlotFilter(
            label: settings.strings.head,
            slot: EquipmentSlot.head,
          ),

          _buildSlotFilter(
            label: settings.strings.wings,
            slot: EquipmentSlot.wings,
          ),

          _buildSlotFilter(
            label: settings.strings.weapon,
            slot: EquipmentSlot.weapon,
          ),

          _buildSlotFilter(
            label: settings.strings.chest,
            slot: EquipmentSlot.chest,
          ),

          _buildSlotFilter(
            label: settings.strings.shield,
            slot: EquipmentSlot.shield,
          ),

          _buildSlotFilter(
            label: settings.strings.accessory,
            slot: EquipmentSlot.accessory,
          ),

          _buildSlotFilter(
            label: settings.strings.legs,
            slot: EquipmentSlot.legs,
          ),

          _buildSlotFilter(
            label: settings.strings.belt,
            slot: EquipmentSlot.belt,
          ),
        ],
      ),
    );
  }

  Widget _buildSlotFilter({
    required String label,
    required EquipmentSlot slot,
  }) {
    return _buildFilter(
      label: label,
      selected:
          selectedFilter == InventoryFilterType.slot &&
              selectedSlot == slot,
      onTap: () => onSelectSlot(slot),
    );
  }

  Widget _buildFilter({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.surfaceLight
                : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected
                  ? AppColors.textPrimary
                  : AppColors.border,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}