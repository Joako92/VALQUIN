import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../models/equipment_item.dart';

class InventoryVariantSelector extends StatelessWidget {
  final EquipmentItem item;
  final int Function(EquipmentItem) selectedVariantFor;
  final int Function(EquipmentItem) availableVariantCount;
  final void Function(EquipmentItem, int) onVariantSelected;

  const InventoryVariantSelector({
    super.key,
    required this.item,
    required this.selectedVariantFor,
    required this.availableVariantCount,
    required this.onVariantSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectedVariant = selectedVariantFor(item);
    final variantCount = availableVariantCount(item);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int variantIndex = 0;
            variantIndex < variantCount;
            variantIndex++)
          GestureDetector(
            onTap: () {
              onVariantSelected(
                item,
                variantIndex,
              );
            },
            child: SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: Text(
                  variantIndex == selectedVariant
                      ? '[${variantIndex + 1}]'
                      : '${variantIndex + 1}',
                  style: TextStyle(
                    color: variantIndex == selectedVariant
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight:
                        variantIndex == selectedVariant
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}