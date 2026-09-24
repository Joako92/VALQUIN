import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';
import '../config/avatar_config.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../managers/class_manager.dart';
import '../widgets/valquin_icon.dart';

import 'main_screen.dart';

class CreatePlayerScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;
  final AppSettings settings;

  const CreatePlayerScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
    required this.settings,
  });

  @override
  State<CreatePlayerScreen> createState() =>
      _CreatePlayerScreenState();
}

class _CreatePlayerScreenState
    extends State<CreatePlayerScreen> {
  final TextEditingController _nameController =
      TextEditingController();

  bool isCreating = false;

  String _selectedAvatarId = 'male_01';

  // --------------------------------------------------
  // GET MANAGERS
  // --------------------------------------------------

  PlayerManager get playerManager =>
      widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  ClassManager get classManager =>
      widget.classManager;

  AppDatabase get database =>
      widget.database;

  AppSettings get settings =>
      widget.settings;

  // --------------------------------------------------
  // DISPOSE
  // --------------------------------------------------

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // CREATE PLAYER
  // --------------------------------------------------

  Future<void> createPlayer() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.error,
          content: Text(
            settings.strings.playerNamePlaceholder,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      return;
    }

    setState(() {
      isCreating = true;
    });

    await playerManager.createPlayer(
      name: name,
      avatarId: _selectedAvatarId,
    );

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MainScreen(
          playerManager: playerManager,
          trainingPlanManager: trainingPlanManager,
          classManager: classManager,
          database: database,
          settings: settings,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // SELECT AVATAR
  // --------------------------------------------------

  void selectAvatar(String avatarId) {
    if (isCreating) {
      return;
    }

    setState(() {
      _selectedAvatarId = avatarId;
    });
  }

  // --------------------------------------------------
  // AVATAR CARD
  // --------------------------------------------------

  Widget buildAvatarCard(
    BuildContext context,
    AvatarDefinition avatar,
  ) {
    final isSelected =
        avatar.id == _selectedAvatarId;

    final primaryColor =
        Theme.of(context).colorScheme.primary;

    return Expanded(
      child: GestureDetector(
        onTap: () => selectAvatar(avatar.id),
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 150),
          margin:
              const EdgeInsets.symmetric(horizontal: 5),
          padding:
              const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.surfaceLight
                : AppColors.surface,
            borderRadius:
                BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? primaryColor
                  : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/avatar/'
                  '${avatar.id}_front.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                avatar.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: isSelected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              // --------------------------------------------------
              // TITLE
              // --------------------------------------------------

              const SizedBox(height: 30),

              Text(
                settings.strings.createYourCharacter,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.title,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                settings.strings.beginTrainingJourney,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 25),

              // --------------------------------------------------
              // AVATAR SELECTION
              // --------------------------------------------------

              Text(
                settings.strings.selectAvatar,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  children: availableAvatars
                      .map(
                        (avatar) =>
                            buildAvatarCard(
                          context,
                          avatar,
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 20),

              // --------------------------------------------------
              // NAME
              // --------------------------------------------------

              TextField(
                controller: _nameController,
                enabled: !isCreating,
                textCapitalization:
                    TextCapitalization.words,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                ),
                cursorColor:
                    Theme.of(context)
                        .colorScheme
                        .primary,
                decoration: InputDecoration(
                  labelText:
                      settings.strings.playerName,
                  hintText:
                      settings.strings.enterYourName,
                  labelStyle: const TextStyle(
                    color:
                        AppColors.textSecondary,
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.textDisabled,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  prefixIcon: ValquinIcon(
                    AppIcons.status,
                    size: 22,
                    color:
                        AppColors.textSecondary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color:
                          Theme.of(context)
                              .colorScheme
                              .primary,
                      width: 2,
                    ),
                  ),
                  disabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --------------------------------------------------
              // CREATE
              // --------------------------------------------------

              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed:
                      isCreating
                          ? null
                          : createPlayer,
                  icon: isCreating
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                            color:
                                AppColors.textPrimary,
                          ),
                        )
                      : const Icon(
                          AppIcons.experience,
                        ),
                  label: Text(
                    isCreating
                        ? settings
                            .strings
                            .creating
                        : settings
                            .strings
                            .createPlayer,
                    style:
                        const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context)
                            .colorScheme
                            .primary,
                    foregroundColor:
                        AppColors.textPrimary,
                    disabledBackgroundColor:
                        AppColors.surfaceLight,
                    disabledForegroundColor:
                        AppColors.textDisabled,
                    elevation: 0,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}