import 'dart:ui';

import 'package:flutter/material.dart';

import '../config/equipment_visual_config.dart';
import '../models/equipment_item.dart';

class EquipmentRenderer extends StatelessWidget {
  final EquipmentItem item;
  final EquipmentView view;

  const EquipmentRenderer({
    super.key,
    required this.item,
    required this.view,
  });

  String _viewName() {
    switch (view) {
      case EquipmentView.front:
        return 'front';

      case EquipmentView.threeQuarter:
        return '3q';

      case EquipmentView.side:
        return 'side';

      case EquipmentView.back:
        return 'back';
    }
  }

  String _assetPath() {
    return 'assets/images/equipment/'
        '${item.id}_${_viewName()}.png';
  }

  @override
  Widget build(BuildContext context) {
    final config = equipmentVisualConfigs[item.id];

    if (config == null) {
      return const SizedBox.shrink();
    }

    final glowColor = rarityGlowColor(item.rarity.name);

    return Transform.translate(
      offset: config.offsetFor(view),
      child: Transform.scale(
        scale: config.scale,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              _assetPath(),
              fit: BoxFit.contain,
              color: glowColor,
              colorBlendMode: BlendMode.srcIn,
            ),

            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 8,
                sigmaY: 8,
              ),
              child: Image.asset(
                _assetPath(),
                fit: BoxFit.contain,
                color: glowColor,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),

            Image.asset(
              _assetPath(),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}