import 'package:flutter/material.dart';
import '../config/app_config.dart';

class ValquinBackground extends StatelessWidget {
  const ValquinBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.accentDark,
            Color(0xFF120B0E),
            Color(0xFF08090B),
            Color.fromARGB(255, 0, 0, 0),
          ],
          stops: [
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