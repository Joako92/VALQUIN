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

    return LayoutBuilder(
      builder: (context, constraints) {
        final hasFiniteWidth = constraints.maxWidth.isFinite;

        // When the selector is inside a layout with a finite width
        // (such as EquipScreen), distribute the available space.
        //
        // When the width is unbounded (such as InventoryScreen),
        // keep a compact fixed width so the Row can shrink-wrap safely.
        final itemWidth = hasFiniteWidth
            ? constraints.maxWidth / variantCount
            : 30.0;

        return Row(
          mainAxisSize:
              hasFiniteWidth ? MainAxisSize.max : MainAxisSize.min,
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
                  width: itemWidth,
                  height: 30,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
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
              ),
          ],
        );
      },
    );
  }
}