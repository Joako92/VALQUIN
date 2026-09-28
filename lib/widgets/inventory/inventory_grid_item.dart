import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../models/equipment_item.dart';
import '../../models/equipment_slot.dart';

import '../valquin_icon_glow.dart';
import 'inventory_cooldown_overlay.dart';

class InventoryGridItem extends StatelessWidget {
  final EquipmentItem item;
  final bool isSelected;
  final bool isEquipped;
  final bool isOnCooldown;

  final Color rarity;
  final Color glow;

  final String Function(EquipmentSlot) slotIconAsset;
  final Duration? cooldownRemaining;
  final String cooldownLabel;

  final VoidCallback onTap;

  const InventoryGridItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isEquipped,
    required this.isOnCooldown,
    required this.rarity,
    required this.glow,
    required this.slotIconAsset,
    required this.cooldownRemaining,
    required this.onTap,
    required this.cooldownLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? rarity
                      : AppColors.border,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ValquinIconGlow(
                      asset: slotIconAsset(item.slot),
                      size: 90,
                      color: rarity,
                      glowColor: glow,
                      glowOpacity:
                          isSelected ? 0.8 : 0.35,
                      blur: isSelected ? 10 : 7,
                    ),
                  ),

                  if (isEquipped && !isOnCooldown)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Icon(
                        AppIcons.selected,
                        size: 15,
                        color: rarity,
                      ),
                    ),

                  if (isOnCooldown)
                    InventoryCooldownOverlay(
                      cooldownRemaining: cooldownRemaining,
                      cooldownLabel: cooldownLabel,
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              fontSize: 10,
              fontWeight: isSelected
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}