import 'package:flutter/material.dart';

// import '../config/app_config.dart';

class ValquinBackground extends StatelessWidget {
  const ValquinBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
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