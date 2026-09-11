import 'package:flutter/material.dart';
import 'package:valquin/localization/language.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';
import '../config/equipment_visual_config.dart';

import '../renderers/avatar_renderer.dart';
import '../renderers/equipment_renderer.dart';

import '../managers/player_manager.dart';
import '../managers/class_manager.dart';
import '../managers/training_plan_manager.dart';

import '../models/player.dart';
import '../models/equipment_slot.dart';

import '../widgets/valquin_icon.dart';

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
  // AVATAR
  // --------------------------------------------------

  int _avatarViewIndex = 0;

  EquipmentView get _equipmentView {
    switch (_avatarViewIndex) {
      case 0:
        return EquipmentView.front;

      case 1:
        return EquipmentView.threeQuarter;

      case 2:
        return EquipmentView.side;

      case 3:
        return EquipmentView.back;

      default:
        return EquipmentView.front;
    }
  }

  void _rotateAvatarRight() {
    if (_avatarViewIndex < 3) {
      setState(() {
        _avatarViewIndex++;
      });
    }
  }

  void _rotateAvatarLeft() {
    if (_avatarViewIndex > 0) {
      setState(() {
        _avatarViewIndex--;
      });
    }
  }

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

    final equippedBySlot = {
      for (final item in equippedItems)
        item.slot: item,
    };

    final head = equippedBySlot[EquipmentSlot.head];
    final shoulders = equippedBySlot[EquipmentSlot.shoulders];
    final chest = equippedBySlot[EquipmentSlot.chest];
    final belt = equippedBySlot[EquipmentSlot.belt];
    final legs = equippedBySlot[EquipmentSlot.legs];

    final hasHelmet = head != null;

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

              Stack(
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
                    decoration: BoxDecoration(
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
                              onPressed: () {
                                _showResetPlayerDialog(context);
                              },
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
                              Theme.of(context)
                                  .colorScheme
                                  .primary,
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
                      onPressed: () {
                        _showSettingsDialog(context);
                      },
                      icon: const Icon(
                        AppIcons.settings,
                        size: 22,
                      ),
                      color: AppColors.textSecondary,
                      tooltip: settings.strings.settings,
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
                    // --------------------------------------------------
                    // COLUMN
                    // --------------------------------------------------

                    Transform.translate(
                      offset: const Offset(0, 320),
                      child: Transform.scale(
                        scaleX: 1.2,
                        scaleY: 0.7,
                        child: Image.asset(
                          'assets/images/valquin_column.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // --------------------------------------------------
                    // AVATAR + EQUIPMENT
                    // --------------------------------------------------

                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        final velocity =
                            details.primaryVelocity ?? 0;

                        if (velocity < 0) {
                          _rotateAvatarRight();
                        } else if (velocity > 0) {
                          _rotateAvatarLeft();
                        }
                      },
                      child: Transform.translate(
                        offset: const Offset(0, 30),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // --------------------------------------------------
                            // BASE AVATAR
                            // --------------------------------------------------

                            AvatarRenderer(
                              avatarId: 'male_02',
                              viewIndex: _avatarViewIndex,
                              hasHelmet: hasHelmet,
                            ),

                            // --------------------------------------------------
                            // LEGS
                            // --------------------------------------------------

                            if (legs != null)
                              EquipmentRenderer(
                                item: legs,
                                view: _equipmentView,
                              ),

                            // --------------------------------------------------
                            // CHEST
                            // --------------------------------------------------

                            if (chest != null)
                              EquipmentRenderer(
                                item: chest,
                                view: _equipmentView,
                              ),

                            // --------------------------------------------------
                            // BELT
                            // --------------------------------------------------

                            if (belt != null)
                              EquipmentRenderer(
                                item: belt,
                                view: _equipmentView,
                              ),

                            // --------------------------------------------------
                            // SHOULDERS
                            // --------------------------------------------------

                            if (shoulders != null)
                              EquipmentRenderer(
                                item: shoulders,
                                view: _equipmentView,
                              ),

                            // --------------------------------------------------
                            // HEAD
                            // --------------------------------------------------

                            if (head != null)
                              EquipmentRenderer(
                                item: head,
                                view: _equipmentView,
                              ),
                          ],
                        ),
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
              child: Text(
                settings.strings.later,
                style: const TextStyle(
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
        return ListenableBuilder(
          listenable: settings,
          builder: (context, child) {
            return AlertDialog(
              backgroundColor: AppColors.surface,
              title: Text(
                settings.strings.settings,
                style: const TextStyle(
                  color: AppColors.title,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    settings.strings.accentColor,
                    style: const TextStyle(
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
                      _buildAccentOption(Colors.red),
                      _buildAccentOption(Colors.blue),
                      _buildAccentOption(Colors.green),
                      _buildAccentOption(Colors.purple),
                      _buildAccentOption(Colors.orange),
                      _buildAccentOption(Colors.cyan),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text(
                    settings.strings.languageString,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _buildLanguageOption(
                    AppLanguage.english,
                    settings.strings.english,
                  ),

                  _buildLanguageOption(
                    AppLanguage.spanish,
                    settings.strings.spanish,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text(
                    settings.strings.close,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // --------------------------------------------------
  // ACCENT COLOR OPTION
  // --------------------------------------------------

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
  // LANGUAGE OPTION
  // --------------------------------------------------

  Widget _buildLanguageOption(
    AppLanguage language,
    String label,
  ) {
    final isSelected = settings.language == language;

    return GestureDetector(
      onTap: () {
        settings.setLanguage(language);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context)
                          .colorScheme
                          .primary
                      : AppColors.textSecondary,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .colorScheme
                              .primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
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
                Navigator.of(dialogContext).pop();
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
                Navigator.of(dialogContext).pop();

                await playerManager.resetPlayer();

                if (!context.mounted) {
                  return;
                }

                setState(() {});

                ScaffoldMessenger.of(context)
                    .showSnackBar(
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
              style: TextButton.styleFrom(
                foregroundColor: AppColors.error,
              ),
              child: Text(
                settings.strings.reset,
              ),
            ),
          ],
        );
      },
    );
  }
}
