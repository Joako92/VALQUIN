import 'package:flutter/material.dart';

class AvatarRenderer extends StatelessWidget {
  final String avatarId;
  final int viewIndex;
  final bool hasHelmet;

  const AvatarRenderer({
    super.key,
    required this.avatarId,
    required this.viewIndex,
    required this.hasHelmet,
  });

  String _viewName() {
    switch (viewIndex) {
      case 0:
        return 'front';
      case 1:
        return '3q';
      case 2:
        return 'side';
      case 3:
        return 'back';
      default:
        return 'front';
    }
  }

  String _assetPath() {
    final viewName = _viewName();
    final suffix = hasHelmet ? '_b' : '';

    return 'assets/images/avatar/'
        '${avatarId}_${viewName}${suffix}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _assetPath(),
      fit: BoxFit.contain,
    );
  }
}
