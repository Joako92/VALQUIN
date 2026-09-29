import 'package:flutter/material.dart';

class ValquinBackground extends StatelessWidget {
  const ValquinBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isLight
              ? [
                  accent,
                const Color(0xFFB8D4E8),
                const Color(0xFF8FB5D0),
                const Color.fromARGB(255, 255, 255, 255),
                ]
              : [
                  accent,
                  const Color(0xFF120B0E),
                  const Color(0xFF08090B),
                  const Color.fromARGB(255, 0, 0, 0),
                ],
          stops: const [
            0.0,
            0.25,
            0.65,
            1.0,
          ],
        ),
      ),
      child: child,
    );
  }
}