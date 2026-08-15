import 'package:flutter/material.dart';

class EquipmentItemWidget extends StatelessWidget {
  final String name;
  final String rarity;
  final String slot;
  final List<String> exercises;
  final VoidCallback? onPressed;
  final bool equipped;

  const EquipmentItemWidget({
    super.key,
    required this.name,
    required this.rarity,
    required this.slot,
    required this.exercises,
    this.onPressed,
    this.equipped = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFF111827),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: equipped
              ? Colors.blueAccent
              : Colors.white12,
        ),
      ),

      child: Row(
        children: [
          // --------------------------------------------------
          // ICON
          // --------------------------------------------------

          Container(
            width: 55,
            height: 55,

            decoration: BoxDecoration(
              color: Colors.black26,

              borderRadius: BorderRadius.circular(10),

              border: Border.all(
                color: Colors.white12,
              ),
            ),

            child: const Icon(
              Icons.shield_outlined,
              size: 30,
              color: Colors.blueAccent,
            ),
          ),

          const SizedBox(width: 15),

          // --------------------------------------------------
          // INFORMATION
          // --------------------------------------------------

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                ...exercises.map(
                  (exercise) => Text(
                    exercise,

                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text(
                      slot,

                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white38,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      rarity,

                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // EQUIP BUTTON
          // --------------------------------------------------

          IconButton(
            onPressed: onPressed,

            icon: Icon(
              equipped
                  ? Icons.check_circle
                  : Icons.add_circle_outline,

              color: Colors.blueAccent,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}