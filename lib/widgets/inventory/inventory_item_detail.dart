import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import '../../config/app_settings.dart';
import '../../config/equipment_visual_config.dart';

import '../../managers/player_manager.dart';
import '../../managers/training_plan_manager.dart';

import '../../models/equipment_item.dart';

import '../valquin_icon_glow.dart';
import 'inventory_cooldown_overlay.dart';
import 'inventory_variant_selector.dart';

class InventoryItemDetail extends StatelessWidget {
  final EquipmentItem item;
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppSettings settings;

  final int Function(EquipmentItem) selectedVariantFor;
  final int Function(EquipmentItem) availableVariantCount;
  final void Function(EquipmentItem, int) onVariantSelected;

  final String Function(EquipmentItem, int) exerciseDetail;
  final String Function(EquipmentItem) formatEquipRequirement;

  final Duration? Function(EquipmentItem) cooldownRemaining;
  final bool Function(EquipmentItem) isOnCooldown;

  final Future<void> Function(EquipmentItem) onEquip;

  const InventoryItemDetail({
    super.key,
    required this.item,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.settings,
    required this.selectedVariantFor,
    required this.availableVariantCount,
    required this.onVariantSelected,
    required this.exerciseDetail,
    required this.formatEquipRequirement,
    required this.cooldownRemaining,
    required this.isOnCooldown,
    required this.onEquip,
  });

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;
    final trainingPlan = trainingPlanManager.trainingPlan;

    final rarity = rarityColor(item.rarity);
    final glow = rarityGlowColor(item.rarity);

    final isEquipped = trainingPlan.containsItem(item);
    final itemIsOnCooldown = isOnCooldown(item);

    final canEquip = player != null &&
        trainingPlan.canEquipItem(
          item,
          player,
        );

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemActionColumn(
            context,
            rarity,
            glow,
            isEquipped,
            itemIsOnCooldown,
            canEquip,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildItemInformation(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemActionColumn(
    BuildContext context,
    Color rarity,
    Color glow,
    bool isEquipped,
    bool itemIsOnCooldown,
    bool canEquip,
  ) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: rarity.withValues(alpha: 0.7),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: ValquinIconGlow(
                  asset: equipmentSlotIcon(item.slot),
                  size: 90,
                  color: rarity,
                  glowColor: glow,
                  glowOpacity: 0.75,
                  blur: 8,
                ),
              ),
              if (itemIsOnCooldown)
                InventoryCooldownOverlay(
                  cooldownRemaining: cooldownRemaining(item),
                  cooldownLabel: settings.strings.cooldown,
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 90,
          height: 34,
          child: ElevatedButton(
            onPressed: itemIsOnCooldown ||
                    (!canEquip && !isEquipped)
                ? null
                : () => onEquip(item),
            style: ElevatedButton.styleFrom(
              backgroundColor: rarity,
              foregroundColor: AppColors.background,
              disabledBackgroundColor:
                  AppColors.surfaceLight,
              disabledForegroundColor:
                  AppColors.textDisabled,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              isEquipped
                  ? settings.strings.unequip
                  : settings.strings.equip,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.rarity.name.toUpperCase(),
          style: TextStyle(
            color: rarityColor(item.rarity),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              settings.strings.exercises,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(width: 10),
            InventoryVariantSelector(
              item: item,
              selectedVariantFor: selectedVariantFor,
              availableVariantCount: availableVariantCount,
              onVariantSelected: onVariantSelected,
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...List.generate(
          item.exercises.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              '- ${exerciseDetail(item, index)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          settings.strings.requirements,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          formatEquipRequirement(item),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 8,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}