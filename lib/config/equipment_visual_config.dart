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

  // EJEMPLO DE SCALE Y OFFSETS
  // 'gorra_cuero': EquipmentVisualConfig(
  //   scale: 0.45,
  //   offsets: {
  //     EquipmentView.front: Offset(3, -185),
  //     EquipmentView.threeQuarter: Offset(9, -185),
  //     EquipmentView.side: Offset(0, -185),
  //     EquipmentView.back: Offset(-3, -185),
  //   },
  // ),

  'gorra_cuero': EquipmentVisualConfig(),
  'casco_hierro': EquipmentVisualConfig(),
  'visera_bronce': EquipmentVisualConfig(),
  'capucha_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(0, -10),
      EquipmentView.threeQuarter: Offset(0, -10),
      EquipmentView.side: Offset(0, -10),
      EquipmentView.back: Offset(0, -5),
    }
  ),
  'corona_atalanta': EquipmentVisualConfig(),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  'hombreras_cuero': EquipmentVisualConfig(),
  'hombrera_hierro': EquipmentVisualConfig(),
  'hombreras_bronce': EquipmentVisualConfig(),
  'manto_sabio': EquipmentVisualConfig(),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  'pechera_cuero': EquipmentVisualConfig(),
  'pechera_hierro': EquipmentVisualConfig(),
  'pectoral_bronce': EquipmentVisualConfig(),
  'tunica_sabio': EquipmentVisualConfig(),
  'coraza_atlas': EquipmentVisualConfig(),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  'cinturon_cuero': EquipmentVisualConfig(),
  'cinturon_reforzado': EquipmentVisualConfig(),
  'faja_bronce': EquipmentVisualConfig(),
  'cinturon_sabio': EquipmentVisualConfig(),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  'pantalones_cuero': EquipmentVisualConfig(),
  'pantalones_cota': EquipmentVisualConfig(),
  'pollera_bronce': EquipmentVisualConfig(),
  'grebas_sabio': EquipmentVisualConfig(),

  // --------------------------------------------------
  // WEAPONS
  // --------------------------------------------------

  'baculo_madera': EquipmentVisualConfig(
    offsets: {
      EquipmentView.back: Offset(10, 0),
    },),
  'cuchillas_livianas': EquipmentVisualConfig(),
  'daga_larga': EquipmentVisualConfig(),
  'baston_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.back: Offset(10, 0),
    },),
  'espada_heracles': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(-22, -16),
      EquipmentView.threeQuarter: Offset(-42, -6),
      EquipmentView.back: Offset(26, 0),
    },),

  // --------------------------------------------------
  // SHIELD
  // --------------------------------------------------

  'escudo_madera': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(22, 0),
      EquipmentView.back: Offset(-26, 0),
    },
  ),
  'escudo_hierro': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(15, 0),
      EquipmentView.back: Offset(-15, 0),
    },
  ),
  'escudo_largo': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(15, 0),
      EquipmentView.back: Offset(-15, 0),
    },
  ),
  'egida_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(15, 0),
      EquipmentView.threeQuarter: Offset(15, 0),
      EquipmentView.back: Offset(-15, 0),
    },
  ),
  'brazales_hermes': EquipmentVisualConfig(),

  // --------------------------------------------------
  // WINGS
  // --------------------------------------------------

  'capa_viajero': EquipmentVisualConfig(),
  'capa_pesada': EquipmentVisualConfig(),
  'capa_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(28, 0),
      EquipmentView.threeQuarter: Offset(26, 0),
      EquipmentView.side: Offset(24, 0),
      EquipmentView.back: Offset(-38, 0),
    }
  ),
  'manto_campeon': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(33, 0),
      EquipmentView.threeQuarter: Offset(29, 0),
      EquipmentView.back: Offset(-53, 0),
    }
  ),
};