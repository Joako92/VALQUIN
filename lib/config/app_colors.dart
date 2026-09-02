import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─────────────────────────────────────────────
  // GENERAL UI
  // ─────────────────────────────────────────────

  // BACKGROUND
  static const Color background = Color(0xFF000000);

  // SECONDARY / SURFACES
  static const Color surface = Color(0xFF181818);
  static const Color surfaceLight = Color(0xFF242424);
  static const Color border = Color(0xFF3A3A3A);

  // ACCENT
  static const Color accent = Color(0xFFE10600);
  static const Color accentLight = Color(0xFFFF2A23);
  static const Color accentDark = Color(0xFF9E0000);

  // TEXT
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textDisabled = Color(0xFF666666);

  // TITLES
  static const Color title = Color(0xFFFFD23F);

  // ─────────────────────────────────────────────
  // RARITY
  // ─────────────────────────────────────────────

  // COMMON
  static const Color common = Color(0xFFD0D0D0);
  static const Color commonGlow = Color(0xFF000000);

  // RARE
  static const Color rare = Color(0xFF2E9E4F);
  static const Color rareGlow = Color(0xFF247BFF);

  // LEGENDARY
  static const Color legendary = Color(0xFF6A35A8);
  static const Color legendaryGlow = Color(0xFFFFD43B);

  // MYTHIC
  static const Color mythic = Color(0xFFC2188B);
  static const Color mythicGlow = Color(0xFFFFFFFF);

  // ─────────────────────────────────────────────
  // STATES
  // ─────────────────────────────────────────────

  static const Color selected = Color(0xFFE0E0E0);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFB300);
  static const Color error = Color(0xFFE53935);
}
