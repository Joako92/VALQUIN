import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_icons.dart';
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

  const CreatePlayerScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
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
        const SnackBar(
          backgroundColor: AppColors.error,
          content: Text(
            'ENTER A PLAYER NAME',
            style: TextStyle(
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
      backgroundColor: AppColors.background,
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

              const Text(
                'CREATE YOUR CHARACTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.title,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'BEGIN YOUR TRAINING JOURNEY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 45),

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
                cursorColor: AppColors.accent,
                decoration: InputDecoration(
                  labelText: 'PLAYER NAME',
                  hintText: 'Enter your name',

                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                  ),

                  hintStyle: const TextStyle(
                    color: AppColors.textDisabled,
                  ),

                  filled: true,
                  fillColor: AppColors.surface,

                  prefixIcon: ValquinIcon(
                    AppIcons.status,
                    size: 22,
                    color: AppColors.textSecondary,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.border,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.border,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.accent,
                      width: 2,
                    ),
                  ),

                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // --------------------------------------------------
              // CREATE
              // --------------------------------------------------

              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed:
                      isCreating ? null : createPlayer,

                  icon: isCreating
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.textPrimary,
                          ),
                        )
                      : const Icon(
                          AppIcons.experience,
                        ),

                  label: Text(
                    isCreating
                        ? 'CREATING...'
                        : 'CREATE PLAYER',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.accent,
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