import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget {
  final String name;
  final String exercise;
  final String slot;
  final String rarity;
  final VoidCallback? onPressed;

  const ExerciseItem({
    super.key,
    required this.name,
    required this.exercise,
    required this.slot,
    required this.rarity,
    this.onPressed,
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
          color: Colors.white12,
        ),
      ),

      child: Row(
        children: [
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

                Text(
                  exercise,

                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 5),

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

          // ------------------------------------------
          // EQUIP BUTTON
          // ------------------------------------------

          IconButton(
            onPressed: onPressed,

            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.blueAccent,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}