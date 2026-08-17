import 'package:flutter/material.dart';

class EquipmentItemWidget extends StatelessWidget {
  final String name;
  final String rarity;
  final String slot;
  final List<String> exercises;
  final String equipRequirements;

  final VoidCallback? onPressed;

  final bool equipped;
  final bool canEquip;

  const EquipmentItemWidget({
    super.key,
    required this.name,
    required this.rarity,
    required this.slot,
    required this.exercises,
    required this.equipRequirements,
    this.onPressed,
    this.equipped = false,
    this.canEquip = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLocked = !canEquip && !equipped;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: isLocked
            ? const Color(0xFF0D111A)
            : const Color(0xFF111827),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: equipped
              ? Colors.blueAccent
              : isLocked
                  ? Colors.white10
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

            child: Icon(
              Icons.shield_outlined,

              size: 30,

              color: isLocked
                  ? Colors.white24
                  : Colors.blueAccent,
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

                  style: TextStyle(
                    fontSize: 16,

                    fontWeight: FontWeight.bold,

                    color: isLocked
                        ? Colors.white38
                        : Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                ...exercises.map(
                  (exercise) => Text(
                    exercise,

                    style: TextStyle(
                      fontSize: 13,

                      color: isLocked
                          ? Colors.white24
                          : Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // --------------------------------------------------
                // EQUIP REQUIREMENTS
                // --------------------------------------------------

                const Text(
                  'EQUIP REQUIREMENTS',

                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  equipRequirements,

                  style: TextStyle(
                    fontSize: 12,
                    color: isLocked
                        ? Colors.white30
                        : Colors.white54,
                  ),
                ),

                const SizedBox(height: 8),

                // --------------------------------------------------
                // SLOT / RARITY
                // --------------------------------------------------

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

                      style: TextStyle(
                        fontSize: 11,

                        color: isLocked
                            ? Colors.white24
                            : Colors.blueAccent,

                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),
                    ),

                    if (isLocked) ...[
                      const SizedBox(width: 10),

                      const Text(
                        'LOCKED',

                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // --------------------------------------------------
          // EQUIP BUTTON
          // --------------------------------------------------

          IconButton(
            onPressed: isLocked ? null : onPressed,

            icon: Icon(
              equipped
                  ? Icons.check_circle
                  : canEquip
                      ? Icons.add_circle_outline
                      : Icons.lock_outline,

              color: equipped
                  ? Colors.blueAccent
                  : canEquip
                      ? Colors.blueAccent
                      : Colors.white30,

              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}