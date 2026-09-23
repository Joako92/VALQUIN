import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

import '../managers/player_manager.dart';
import '../managers/class_manager.dart';
import '../managers/training_plan_manager.dart';

import '../models/player.dart';

import '../widgets/player_class_change_dialog.dart';
import '../widgets/player_equipment_view.dart';
import '../widgets/player_reset_player_dialog.dart';
import '../widgets/player_settings_dialog.dart';
import '../widgets/player_stats_card.dart';

class PlayerScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final ClassManager classManager;
  final TrainingPlanManager trainingPlanManager;
  final AppSettings settings;

  const PlayerScreen({
    super.key,
    required this.playerManager,
    required this.classManager,
    required this.trainingPlanManager,
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

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppSettings get settings => widget.settings;

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            settings.strings.playerNotLoaded,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    final availableClasses =
        classManager.availableClasses(player);

    // --------------------------------------------------
    // EQUIPPED ITEMS
    // --------------------------------------------------

    final trainingPlan = trainingPlanManager.trainingPlan;
    final equippedItems = trainingPlan.equipment;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // --------------------------------------------------
              // PLAYER STATS
              // --------------------------------------------------

              PlayerStatsCard(
                player: player,
                settings: settings,
                onResetPlayer: () {
                  _showResetPlayerDialog(context);
                },
                onSettings: () {
                  _showSettingsDialog(context);
                },
              ),

              // --------------------------------------------------
              // AVATAR
              // --------------------------------------------------

              Expanded(
                child: PlayerEquipmentView(
                  equipment: equippedItems,
                  avatarId: 'male_01',
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
                    label: Text(
                      settings.strings.classChangeAvailable,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.warning,
                      side: BorderSide(
                        color: AppColors.warning
                            .withValues(alpha: 0.7),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
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
  // CLASS CHANGE DIALOG
  // --------------------------------------------------

  void _showClassChangeDialog(
    BuildContext context,
    List<PlayerClass> availableClasses,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return PlayerClassChangeDialog(
          playerManager: playerManager,
          settings: settings,
          availableClasses: availableClasses,
          onClassChanged: () {
            if (!mounted) {
              return;
            }

            setState(() {});
          },
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
      builder: (_) {
        return PlayerSettingsDialog(
          settings: settings,
        );
      },
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
      builder: (_) {
        return PlayerResetPlayerDialog(
          playerManager: playerManager,
          settings: settings,
          onPlayerReset: () {
            if (!mounted) {
              return;
            }

            setState(() {});

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.error,
                content: Text(
                  settings.strings.playerResetMessage,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}