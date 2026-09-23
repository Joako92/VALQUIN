import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

import '../managers/player_manager.dart';

import '../models/player.dart';

import '../widgets/valquin_icon.dart';

class PlayerClassChangeDialog extends StatelessWidget {
  final PlayerManager playerManager;
  final AppSettings settings;
  final List<PlayerClass> availableClasses;
  final VoidCallback onClassChanged;

  const PlayerClassChangeDialog({
    super.key,
    required this.playerManager,
    required this.settings,
    required this.availableClasses,
    required this.onClassChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        settings.strings.classChangeAvailable,
        style: const TextStyle(
          color: AppColors.title,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            settings.strings.trainingUnlockedMessage,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          ...availableClasses.map(
            (playerClass) {
              return ListTile(
                leading: ValquinIcon(
                  AppIcons.equipment,
                  size: 24,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
                title: Text(
                  _getClassName(playerClass),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  Navigator.of(context).pop();

                  await playerManager.changeClass(
                    playerClass,
                  );

                  onClassChanged();
                },
              );
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            settings.strings.later,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // CLASS NAME
  // --------------------------------------------------

  String _getClassName(
    PlayerClass playerClass,
  ) {
    switch (playerClass) {
      case PlayerClass.novice:
        return settings.strings.classNovice;

      case PlayerClass.powerLifter:
        return settings.strings.classPowerLifter;

      case PlayerClass.runner:
        return settings.strings.classRunner;

      case PlayerClass.bodybuilder:
        return settings.strings.classBodybuilder;

      case PlayerClass.gymnast:
        return settings.strings.classGymnast;

      case PlayerClass.athlete:
        return settings.strings.classAthlete;
    }
  }
}