import 'package:flutter/material.dart';

import '../models/equipment_slot.dart';
import '../models/rarity.dart';

import 'app_colors.dart';
import 'app_icons.dart';

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

Color rarityColor(Rarity rarity) {
  switch (rarity) {
    case Rarity.rare:
      return AppColors.rare;

    case Rarity.legendary:
      return AppColors.legendary;

    case Rarity.mythic:
      return AppColors.mythic;

    case Rarity.common:
      return AppColors.common;
  }
}

Color rarityGlowColor(Rarity rarity) {
  switch (rarity) {
    case Rarity.rare:
      return AppColors.rareGlow;

    case Rarity.legendary:
      return AppColors.legendaryGlow;

    case Rarity.mythic:
      return AppColors.mythicGlow;

    case Rarity.common:
      return AppColors.commonGlow;
  }
}

String equipmentSlotIcon(EquipmentSlot slot) {
  switch (slot) {
    case EquipmentSlot.shoulders:
      return AppIcons.shoulders;

    case EquipmentSlot.head:
      return AppIcons.head;

    case EquipmentSlot.wings:
      return AppIcons.wings;

    case EquipmentSlot.weapon:
      return AppIcons.weapon;

    case EquipmentSlot.chest:
      return AppIcons.chest;

    case EquipmentSlot.shield:
      return AppIcons.shield;

    case EquipmentSlot.accessory:
      return AppIcons.accessory;

    case EquipmentSlot.legs:
      return AppIcons.legs;

    case EquipmentSlot.belt:
      return AppIcons.belt;
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
  // 'casco_cuero': EquipmentVisualConfig(
  //   scale: 0.45,
  //   offsets: {
  //     EquipmentView.front: Offset(3, -185),
  //     EquipmentView.threeQuarter: Offset(9, -185),
  //     EquipmentView.side: Offset(0, -185),
  //     EquipmentView.back: Offset(-3, -185),
  //   },
  // ),

  'casco_cuero': EquipmentVisualConfig(),
  'casco_hierro': EquipmentVisualConfig(),
  'casco_bronce': EquipmentVisualConfig(),
  'casco_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(0, -10),
      EquipmentView.threeQuarter: Offset(0, -10),
      EquipmentView.side: Offset(0, -10),
      EquipmentView.back: Offset(0, -5),
    },
  ),
  'casco_atalanta': EquipmentVisualConfig(),
  'casco_dragon': EquipmentVisualConfig(),

  // --------------------------------------------------
  // SHOULDERS
  // --------------------------------------------------

  'hombreras_cuero': EquipmentVisualConfig(),
  'hombreras_hierro': EquipmentVisualConfig(),
  'hombreras_bronce': EquipmentVisualConfig(),
  'hombreras_sabio': EquipmentVisualConfig(),
  'hombreras_dragon': EquipmentVisualConfig(),

  // --------------------------------------------------
  // CHEST
  // --------------------------------------------------

  'pechera_cuero': EquipmentVisualConfig(),
  'pechera_hierro': EquipmentVisualConfig(),
  'pechera_bronce': EquipmentVisualConfig(),
  'pechera_sabio': EquipmentVisualConfig(),
  'pechera_atlas': EquipmentVisualConfig(),
  'pechera_dragon': EquipmentVisualConfig(),

  // --------------------------------------------------
  // BELT
  // --------------------------------------------------

  'cinturon_cuero': EquipmentVisualConfig(),
  'cinturon_hierro': EquipmentVisualConfig(),
  'cinturon_bronce': EquipmentVisualConfig(),
  'cinturon_sabio': EquipmentVisualConfig(),
  'cinturon_dragon': EquipmentVisualConfig(),

  // --------------------------------------------------
  // LEGS
  // --------------------------------------------------

  'pantalones_cuero': EquipmentVisualConfig(),
  'pantalones_hierro': EquipmentVisualConfig(),
  'pantalones_bronce': EquipmentVisualConfig(),
  'pantalones_sabio': EquipmentVisualConfig(),
  'pantalones_dragon': EquipmentVisualConfig(),

  // --------------------------------------------------
  // WEAPONS
  // --------------------------------------------------

  'baculo_madera': EquipmentVisualConfig(
    offsets: {
      EquipmentView.back: Offset(10, 0),
    },
  ),

  'cuchillas_livianas': EquipmentVisualConfig(),

  'daga_larga': EquipmentVisualConfig(),

  'baston_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.back: Offset(10, 0),
    },
  ),

  'espada_heracles': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(-22, -16),
      EquipmentView.threeQuarter: Offset(-42, -6),
      EquipmentView.back: Offset(26, 0),
    },
  ),

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
      EquipmentView.threeQuarter: Offset(15, 0),
      EquipmentView.back: Offset(-20, 0),
    },
  ),

  'egida_sabio': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(15, 0),
      EquipmentView.threeQuarter: Offset(15, 0),
      EquipmentView.back: Offset(-20, 0),
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
    },
  ),

  'capa_campeon': EquipmentVisualConfig(
    offsets: {
      EquipmentView.front: Offset(33, 0),
      EquipmentView.threeQuarter: Offset(29, 0),
      EquipmentView.back: Offset(-53, 0),
    },
  ),

  'alas_angel': EquipmentVisualConfig(),

};
