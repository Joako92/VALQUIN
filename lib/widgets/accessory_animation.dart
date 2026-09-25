import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/equipment_item.dart';
import '../models/rarity.dart';

import '../config/app_colors.dart';

class AccessoryAnimation extends StatefulWidget {
  final EquipmentItem accessory;

  final Duration frameDuration;

  const AccessoryAnimation({
    super.key,
    required this.accessory,
    this.frameDuration = const Duration(milliseconds: 120),
  });

  @override
  State<AccessoryAnimation> createState() =>
      _AccessoryAnimationState();
}

class _AccessoryAnimationState extends State<AccessoryAnimation> {
  // --------------------------------------------------
  // ANIMATION
  // --------------------------------------------------

  int _currentFrame = 1;

  bool _isAnimating = false;

  Timer? _animationTimer;

  // --------------------------------------------------
  // ASSET
  // --------------------------------------------------

  String _getFramePath(int frame) {
    return 'assets/images/accesory/'
        '${widget.accessory.id}_$frame.png';
  }

  // --------------------------------------------------
  // RARITY GLOW
  // --------------------------------------------------

  Color _getGlowColor() {
    switch (widget.accessory.rarity) {
      case Rarity.common:
        return AppColors.commonGlow;

      case Rarity.rare:
        return AppColors.rareGlow;

      case Rarity.legendary:
        return AppColors.legendaryGlow;

      case Rarity.mythic:
        return AppColors.mythicGlow;
    }
  }

  // --------------------------------------------------
  // TAP
  // --------------------------------------------------

  void _startAnimation() {
    if (_isAnimating) {
      return;
    }

    _animationTimer?.cancel();

    setState(() {
      _isAnimating = true;
      _currentFrame = 1;
    });

    // Animation sequence:
    // 1 → 2 → 3 → 4 → 4 → 3 → 2 → 1
    const animationSequence = [
      1,
      2,
      3,
      4,
      4,
      3,
      2,
      1,
    ];

    int sequenceIndex = 0;

    _animationTimer = Timer.periodic(
      widget.frameDuration,
      (timer) {
        sequenceIndex++;

        if (sequenceIndex >= animationSequence.length) {
          timer.cancel();

          if (!mounted) {
            return;
          }

          setState(() {
            _currentFrame = 1;
            _isAnimating = false;
          });

          return;
        }

        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          _currentFrame =
              animationSequence[sequenceIndex];
        });
      },
    );
  }

  // --------------------------------------------------
  // DISPOSE
  // --------------------------------------------------

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnimation,
      child: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // --------------------------------------------------
            // RARITY GLOW
            // --------------------------------------------------

            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _getGlowColor(),
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  _getFramePath(_currentFrame),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // --------------------------------------------------
            // ORIGINAL ACCESSORY
            // --------------------------------------------------

            Image.asset(
              _getFramePath(_currentFrame),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
