import 'package:flutter/material.dart';

class EquipmentSlot extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<String> exercises;

  final bool isActive;
  final bool isOnCooldown;
  final Duration? cooldownRemaining;

  final VoidCallback? onPressed;

  final double width;
  final double height;

  const EquipmentSlot({
    super.key,
    required this.label,
    required this.icon,
    this.exercises = const [],
    this.isActive = false,
    this.isOnCooldown = false,
    this.cooldownRemaining,
    this.onPressed,
    this.width = 100,
    this.height = 100,
  });

  String formatCooldown(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final bool isEquipped = exercises.isNotEmpty;

    return InkWell(
      onTap: isOnCooldown ? null : onPressed,

      borderRadius: BorderRadius.circular(15),

      child: Container(
        width: width,
        height: height,

        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF111C2E)
              : const Color(0xFF0D111A),

          borderRadius: BorderRadius.circular(15),

          border: Border.all(
            color: isActive
                ? Colors.blueAccent
                : Colors.blueAccent.withValues(alpha: 0.25),

            width: isActive ? 1.5 : 1,
          ),

          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: 0.15),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),

        child: Stack(
          children: [
            // --------------------------------------------------
            // NORMAL SLOT CONTENT
            // --------------------------------------------------

            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  icon,

                  size: 50,

                  color: isActive
                      ? Colors.blueAccent
                      : Colors.blueAccent.withValues(alpha: 0.7),
                ),

                const SizedBox(height: 8),

                if (!isEquipped)

                  Text(
                    label,

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 12,

                      color: isActive
                          ? Colors.white
                          : Colors.white54,

                      fontWeight: FontWeight.bold,

                      letterSpacing: 1,
                    ),
                  )

                else

                  ...exercises.map(
                    (exercise) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 4,
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(
                              isActive
                                  ? Icons.circle
                                  : Icons.circle_outlined,

                              size: 8,

                              color: isActive
                                  ? Colors.blueAccent
                                  : Colors.white30,
                            ),

                            const SizedBox(width: 5),

                            Flexible(
                              child: Text(
                                exercise,

                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  fontSize: 11,

                                  color: isActive
                                      ? Colors.white
                                      : Colors.white54,

                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),

            // --------------------------------------------------
            // COOLDOWN OVERLAY
            // --------------------------------------------------

            if (isOnCooldown)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),

                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Icon(
                        Icons.lock,
                        color: Colors.white70,
                        size: 28,
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'COOLDOWN',

                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        cooldownRemaining != null
                            ? formatCooldown(cooldownRemaining!)
                            : '--:--:--',

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}