import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppSettings extends ChangeNotifier {
  Color _accentColor;

  AppSettings({
    Color accentColor = AppColors.accent,
  }) : _accentColor = accentColor;

  Color get accentColor => _accentColor;

  void setAccentColor(Color color) {
    if (_accentColor == color) {
      return;
    }

    _accentColor = color;
    notifyListeners();
  }
}