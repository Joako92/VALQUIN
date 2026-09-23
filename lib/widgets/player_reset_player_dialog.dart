import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

import '../managers/player_manager.dart';

class PlayerResetPlayerDialog extends StatelessWidget {
  final PlayerManager playerManager;
  final AppSettings settings;
  final VoidCallback onPlayerReset;

  const PlayerResetPlayerDialog({
    super.key,
    required this.playerManager,
    required this.settings,
    required this.onPlayerReset,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        settings.strings.resetPlayer,
        style: const TextStyle(
          color: AppColors.title,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        settings.strings.resetPlayerConfirmation,
        style: const TextStyle(
          color: AppColors.textSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            settings.strings.cancel,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();

            await playerManager.resetPlayer();

            onPlayerReset();
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.error,
          ),
          child: Text(
            settings.strings.reset,
          ),
        ),
      ],
    );
  }
}