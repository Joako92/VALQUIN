import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';
import '../managers/player_manager.dart';
import '../managers/class_manager.dart';
import '../models/player.dart';
import '../widgets/valquin_icon.dart';

class PlayerScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final ClassManager classManager;
  final AppSettings settings;

  const PlayerScreen({
    super.key,
    required this.playerManager,
    required this.classManager,
    required this.settings,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  // --------------------------------------------------
  // MANAGERS
  // --------------------------------------------------

  PlayerManager get playerManager => widget.playerManager;

  ClassManager get classManager => widget.classManager;

  AppSettings get settings => widget.settings;

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'PLAYER NOT LOADED',
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    final availableClasses =
        classManager.availableClasses(player);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // --------------------------------------------------
              // PLAYER STATS
              // --------------------------------------------------

              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // --------------------------------------------------
                  // STATS CARD
                  // --------------------------------------------------

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.border,
                      ),
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
                              onPressed: () {
                                _showResetPlayerDialog(context);
                              },
                              icon: const Icon(
                                AppIcons.reset,
                                size: 20,
                              ),
                              color: AppColors.textSecondary,
                              tooltip: 'Reset Player',
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              player.playerClass.name.toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'LV ${player.level}',
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
                                'STRENGTH',
                                player.stats.strength,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildAttribute(
                                'ENDURANCE',
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
                                'ENERGY',
                                player.stats.energy,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildAttribute(
                                'STAMINA',
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
                    top: 12,
                    right: 12,
                    child: IconButton(
                      onPressed: () {
                        _showSettingsDialog(context);
                      },
                      icon: const Icon(
                        AppIcons.settings,
                        size: 22,
                      ),
                      color: AppColors.textSecondary,
                      tooltip: 'Settings',
                    ),
                  ),

                  // --------------------------------------------------
                  // TOP GEM
                  // --------------------------------------------------

                  Positioned(
                    top: -15,
                    child: Transform.scale(
                      scaleX: 5.0,
                      scaleY: 1.0,
                      child: Image.asset(
                        'assets/images/gema.png',
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // --------------------------------------------------
                  // BOTTOM FRAME
                  // --------------------------------------------------

                  Positioned(
                    bottom: -98,
                    child: Transform.scale(
                      scaleX: 1.55,
                      scaleY: 0.7,
                      child: Image.asset(
                        'assets/images/marco.png',
                        width: 320,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              // --------------------------------------------------
              // AVATAR
              // --------------------------------------------------

              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // COLUMN
                    Transform.translate(
                      offset: const Offset(0, 240),
                      child: Transform.scale(
                        scaleX: 1.2,
                        scaleY: 0.7,
                        child: Image.asset(
                          'assets/images/valquin_column.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // AVATAR
                    Transform.translate(
                      offset: const Offset(0, -100),
                      child: Image.asset(
                        'assets/images/Avatar-05.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              // --------------------------------------------------
              // CLASS CHANGE AVAILABLE
              // --------------------------------------------------

              if (availableClasses.isNotEmpty) ...[
                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _showClassChangeDialog(
                        context,
                        availableClasses,
                      );
                    },
                    icon: const Icon(
                      AppIcons.info,
                    ),
                    label: const Text(
                      'NEW CLASS AVAILABLE',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          AppColors.warning,
                      side: BorderSide(
                        color: AppColors.warning
                            .withValues(alpha: 0.7),
                      ),
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
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

  // --------------------------------------------------
  // CLASS CHANGE DIALOG
  // --------------------------------------------------

  void _showClassChangeDialog(
    BuildContext context,
    List<PlayerClass> availableClasses,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text(
            'CLASS CHANGE AVAILABLE',
            style: TextStyle(
              color: AppColors.title,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Your training has unlocked new class options.',
                style: TextStyle(
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      playerClass.name.toUpperCase(),
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

                      if (!mounted) {
                        return;
                      }

                      setState(() {});
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
              child: const Text(
                'LATER',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // --------------------------------------------------
  // SETTINGS DIALOG
  // --------------------------------------------------

  void _showSettingsDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text(
            'SETTINGS',
            style: TextStyle(
              color: AppColors.title,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ACCENT COLOR',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildAccentOption(
                    Colors.red,
                  ),
                  _buildAccentOption(
                    Colors.blue,
                  ),
                  _buildAccentOption(
                    Colors.green,
                  ),
                  _buildAccentOption(
                    Colors.purple,
                  ),
                  _buildAccentOption(
                    Colors.orange,
                  ),
                  _buildAccentOption(
                    Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'CLOSE',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAccentOption(
    Color color,
  ) {
    final isSelected = settings.accentColor == color;

    return GestureDetector(
      onTap: () {
        settings.setAccentColor(color);
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: isSelected
                ? AppColors.textPrimary
                : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // RESET PLAYER DIALOG
  // --------------------------------------------------

  void _showResetPlayerDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text(
            'RESET PLAYER?',
            style: TextStyle(
              color: AppColors.title,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Your level, class and attributes will be reset. '
            'Your unlocked training items will be preserved.',
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();

                await playerManager.resetPlayer();

                if (!context.mounted) {
                  return;
                }

                setState(() {});

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.error,
                    content: Text(
                      'PLAYER RESET. YOUR TRAINING JOURNEY BEGINS AGAIN.',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.error,
              ),
              child: const Text(
                'RESET',
              ),
            ),
          ],
        );
      },
    );
  }
}
