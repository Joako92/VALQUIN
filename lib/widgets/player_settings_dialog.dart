import 'package:flutter/material.dart';
import 'package:valquin/localization/language.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

class PlayerSettingsDialog extends StatelessWidget {
  final AppSettings settings;

  const PlayerSettingsDialog({
    super.key,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
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
                  _buildAccentOption(Colors.pink),
                  _buildAccentOption(Colors.deepPurple),
                  _buildAccentOption(Colors.yellow),
                  _buildAccentOption(Colors.white),
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
                context,
                AppLanguage.english,
                settings.strings.english,
              ),

              _buildLanguageOption(
                context,
                AppLanguage.spanish,
                settings.strings.spanish,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
    BuildContext context,
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
}