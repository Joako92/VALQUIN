import 'package:flutter/material.dart';

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

        backgroundColor: const Color(0xFF111827),

        selectedColor: Colors.blueAccent.withValues(alpha: 0.25),

        side: BorderSide(
          color: selected
              ? Colors.blueAccent
              : Colors.white12,
        ),

        labelStyle: TextStyle(
          fontSize: 11,
          letterSpacing: 1,

          color: selected
              ? Colors.blueAccent
              : Colors.white54,
        ),
      ),
    );
  }
}