import 'dart:ui';

import 'package:flutter/material.dart';

import 'valquin_icon.dart';

class ValquinIconGlow extends StatelessWidget {
  final String asset;
  final double size;
  final Color color;
  final Color glowColor;
  final double glowOpacity;
  final double blur;

  const ValquinIconGlow({
    super.key,
    required this.asset,
    required this.size,
    required this.color,
    required this.glowColor,
    this.glowOpacity = 0.7,
    this.blur = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: ValquinIcon(
            asset,
            size: size,
            color: glowColor.withValues(
              alpha: glowOpacity,
            ),
          ),
        ),

        ValquinIcon(
          asset,
          size: size,
          color: color,
        ),
      ],
    );
  }
}