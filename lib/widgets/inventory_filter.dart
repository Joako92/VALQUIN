import 'package:flutter/material.dart';

import '../config/app_config.dart';

class InventoryFilter extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const InventoryFilter({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,

        onSelected: (_) {
          onSelected();
        },

        backgroundColor: AppColors.surface,
        selectedColor:
            AppColors.accent.withValues(alpha: 0.2),

        side: BorderSide(
          color: selected
              ? AppColors.accent
              : AppColors.border,
        ),

        labelStyle: TextStyle(
          fontSize: 11,
          letterSpacing: 1,
          color: selected
              ? AppColors.accent
              : AppColors.textSecondary,
        ),
      ),
    );
  }
}