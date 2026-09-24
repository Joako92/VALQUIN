import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_settings.dart';
import '../database/app_database.dart';
import '../localization/language.dart';
import '../managers/class_manager.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';

import 'create_player_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;
  final AppSettings settings;

  const WelcomeScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settings,
      builder: (context, child) {
        final strings = settings.strings;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 32,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // --------------------------------------------------
                      // LOGO
                      // --------------------------------------------------

                      Image.asset(
                        'assets/icons/logo.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 12),

                      // --------------------------------------------------
                      // TITLE
                      // --------------------------------------------------

                      const Text(
                        'VALQUIN',
                        style: TextStyle(
                          color: AppColors.title,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        '- forge yourself -',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // --------------------------------------------------
                      // LANGUAGE
                      // --------------------------------------------------

                      _buildLanguageSelector(strings),

                      const SizedBox(height: 28),

                      // --------------------------------------------------
                      // DISCLAIMER
                      // --------------------------------------------------

                      _buildDisclaimer(strings),

                      const SizedBox(height: 36),

                      // --------------------------------------------------
                      // START
                      // --------------------------------------------------

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CreatePlayerScreen(
                                  playerManager: playerManager,
                                  trainingPlanManager:
                                      trainingPlanManager,
                                  classManager: classManager,
                                  database: database,
                                  settings: settings,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: settings.accentColor,
                            foregroundColor:
                                AppColors.textPrimary,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            strings.startTraining,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // --------------------------------------------------
  // LANGUAGE SELECTOR
  // --------------------------------------------------

  Widget _buildLanguageSelector(
    LanguageStrings strings,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLanguageButton(
          language: AppLanguage.spanish,
          label: strings.spanish,
          flag: '🇦🇷',
        ),
        const SizedBox(width: 12),
        _buildLanguageButton(
          language: AppLanguage.english,
          label: strings.english,
          flag: '🇺🇸',
        ),
      ],
    );
  }

  Widget _buildLanguageButton({
    required AppLanguage language,
    required String label,
    required String flag,
  }) {
    final isSelected = settings.language == language;

    return GestureDetector(
      onTap: () {
        settings.setLanguage(language);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? settings.accentColor.withValues(alpha: 0.15)
              : AppColors.surface,
          border: Border.all(
            color: isSelected
                ? settings.accentColor
                : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              flag,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? settings.accentColor
                    : AppColors.textPrimary,
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
  // DISCLAIMER
  // --------------------------------------------------

  Widget _buildDisclaimer(
    LanguageStrings strings,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Text(
        strings.welcomeDisclaimer,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );
  }
}
