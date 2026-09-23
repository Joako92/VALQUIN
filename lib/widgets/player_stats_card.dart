import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

import '../models/player.dart';

class PlayerStatsCard extends StatelessWidget {
  final Player player;
  final AppSettings settings;
  final VoidCallback onResetPlayer;
  final VoidCallback onSettings;

  const PlayerStatsCard({
    super.key,
    required this.player,
    required this.settings,
    required this.onResetPlayer,
    required this.onSettings,
  });

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // --------------------------------------------------
        // STATS CARD
        // --------------------------------------------------

        Positioned.fill(
          child: Image.asset(
            'assets/images/card.png',
            fit: BoxFit.fill,
          ),
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 34,
          ),
          decoration: const BoxDecoration(
            // color: AppColors.surface,
            // borderRadius: BorderRadius.circular(20),
            // border: Border.all(
            //   color: AppColors.border,
            // ),
          ),
          child: Column(
            children: [
              // --------------------------------------------------
              // PLAYER IDENTITY
              // --------------------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppColors.title,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onResetPlayer,
                    icon: const Icon(
                      AppIcons.reset,
                      size: 20,
                    ),
                    color: AppColors.textSecondary,
                    tooltip: settings.strings.resetPlayer,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // --------------------------------------------------
              // CLASS + LEVEL
              // --------------------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getClassName(player.playerClass),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${settings.strings.level} ${player.level}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // --------------------------------------------------
              // XP
              // --------------------------------------------------

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: player.xpForCurrentLevel /
                      player.xpRequiredForLevel,
                  minHeight: 10,
                  backgroundColor: AppColors.surfaceLight,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '${player.xpForCurrentLevel}/${player.xpRequiredForLevel} XP',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 24),

              // --------------------------------------------------
              // ATTRIBUTES
              // --------------------------------------------------

              Row(
                children: [
                  Expanded(
                    child: _buildAttribute(
                      settings.strings.attributeStrength,
                      player.stats.strength,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildAttribute(
                      settings.strings.attributeEndurance,
                      player.stats.endurance,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: _buildAttribute(
                      settings.strings.attributeEnergy,
                      player.stats.energy,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildAttribute(
                      settings.strings.attributeStamina,
                      player.stats.stamina,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // --------------------------------------------------
        // SETTINGS
        // --------------------------------------------------

        Positioned(
          top: 25,
          right: 15,
          child: IconButton(
            onPressed: onSettings,
            icon: const Icon(
              AppIcons.settings,
              size: 22,
            ),
            color: AppColors.textSecondary,
            tooltip: settings.strings.settings,
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

  // --------------------------------------------------
  // ATTRIBUTE
  // --------------------------------------------------

  Widget _buildAttribute(
    String name,
    int value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
