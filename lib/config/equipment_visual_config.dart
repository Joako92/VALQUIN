// equipment_visual_config.dart

import 'package:flutter/material.dart';

import 'app_colors.dart';

enum EquipmentView {
  front,
  threeQuarter,
  side,
  back,
}

class EquipmentVisualConfig {
  final double scale;
  final Map<EquipmentView, Offset> offsets;

  const EquipmentVisualConfig({
    this.scale = 1.0,
    this.offsets = const {},
  });

  Offset offsetFor(EquipmentView view) {
    return offsets[view] ?? Offset.zero;
  }
}

Color rarityGlowColor(String rarity) {
  switch (rarity.toLowerCase()) {
    case 'rare':
      return AppColors.rareGlow;

    case 'legendary':
      return AppColors.legendaryGlow;

    case 'mythic':
      return AppColors.mythicGlow;

    case 'common':
    default:
      return AppColors.commonGlow;
  }
}

// --------------------------------------------------
// EQUIPMENT VISUAL CONFIGURATION
// --------------------------------------------------
//
// Equipment pieces created from the VALQUIN master
// preparation canvas use the default scale and offset.
// Their exported dimensions are already aligned to the
// avatar's coordinate system.
//
// Only assets that require special positioning or scaling
// need an explicit configuration here.

const Map<String, EquipmentVisualConfig> equipmentVisualConfigs = {
  // --------------------------------------------------
  // HEAD
  // --------------------------------------------------

  'gorra_cuero': EquipmentVisualConfig(
    scale: 0.45,
    offsets: {
      EquipmentView.front: Offset(3, -185),
      EquipmentView.threeQuarter: Offset(9, -185),
      EquipmentView.side: Offset(0, -185),
      EquipmentView.back: Offset(-3, -185),
    },
  ),

  // Legacy / individually positioned head item.
  'casco_hierro': EquipmentVisualConfig(
    scale: 0.28,
    offsets: {
      EquipmentView.front: Offset(9, -180),
      EquipmentView.threeQuarter: Offset(8, -180),
      EquipmentView.side: Offset(-3, -180),
      EquipmentView.back: Offset(-9, -180),
    },
  ),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  'hombreras_cuero': EquipmentVisualConfig(
    scale: 0.5,
    offsets: {
      EquipmentView.front: Offset(3, -115),
      EquipmentView.threeQuarter: Offset(9, -115),
      EquipmentView.side: Offset(0, -115),
      EquipmentView.back: Offset(-3, -115),
    },
  ),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  'pechera_cuero': EquipmentVisualConfig(
    scale: 0.58,
    offsets: {
      EquipmentView.front: Offset(-1, -78),
      EquipmentView.threeQuarter: Offset(8, -78),
      EquipmentView.side: Offset(-2, -75),
      EquipmentView.back: Offset(-3, -75),
    },
  ),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  'cinturon_cuero': EquipmentVisualConfig(
    scale: 0.55,
    offsets: {
      EquipmentView.front: Offset(2, -24),
      EquipmentView.threeQuarter: Offset(8, -24),
      EquipmentView.side: Offset(-2, -24),
      EquipmentView.back: Offset(-3, -24),
    },
  ),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  'pantalones_cuero': EquipmentVisualConfig(
    scale: 0.55,
    offsets: {
      EquipmentView.front: Offset(2, 90),
      EquipmentView.threeQuarter: Offset(8, 90),
      EquipmentView.side: Offset(-2, 90),
      EquipmentView.back: Offset(-3, 90),
    },
  ),
};