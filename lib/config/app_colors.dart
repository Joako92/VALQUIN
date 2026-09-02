import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─────────────────────────────────────────────
  // GENERAL UI
  // ─────────────────────────────────────────────

  static const Color background = Color(0xFF0D0D0F);
  static const Color surface = Color(0xFF151518);
  static const Color surfaceLight = Color(0xFF1E1E22);

  static const Color border = Color(0xFF2A2A2F);

  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFF9E9EA3);
  static const Color textDisabled = Color(0xFF5C5C62);


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
