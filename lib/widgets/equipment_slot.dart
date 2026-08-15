import 'package:flutter/material.dart';

class EquipmentSlot extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<String> exercises;

  final bool isActive;
  final VoidCallback? onPressed;

  final double width;
  final double height;

  const EquipmentSlot({
    super.key,
    required this.label,
    required this.icon,
    this.exercises = const [],
    this.isActive = false,
    this.onPressed,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEquipped = exercises.isNotEmpty;

    return InkWell(
      onTap: onPressed,

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
                : Colors.blueAccent.withOpacity(0.25),

            width: isActive ? 1.5 : 1,
          ),

          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              icon,

              size: 50,

              color: isActive
                  ? Colors.blueAccent
                  : Colors.blueAccent.withOpacity(0.7),
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
      ),
    );
  }
}