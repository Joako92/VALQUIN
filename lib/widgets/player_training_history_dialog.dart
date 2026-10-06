import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';
import '../models/training_record.dart';

class PlayerTrainingHistoryDialog extends StatelessWidget {
  final List<TrainingRecord> trainingHistory;
  final AppSettings settings;

  const PlayerTrainingHistoryDialog({
    super.key,
    required this.trainingHistory,
    required this.settings,
  });

  String _formatDate(DateTime date) {
    final months = [
      settings.strings.january,
      settings.strings.february,
      settings.strings.march,
      settings.strings.april,
      settings.strings.may,
      settings.strings.june,
      settings.strings.july,
      settings.strings.august,
      settings.strings.september,
      settings.strings.october,
      settings.strings.november,
      settings.strings.december,
    ];

    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} '
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------------------------------
            // HEADER
            // --------------------------------------------------

            Row(
              children: [
                Expanded(
                  child: Text(
                    settings.strings.trainingHistory,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // --------------------------------------------------
            // EMPTY STATE
            // --------------------------------------------------

            if (trainingHistory.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: Center(
                  child: Text(
                    settings.strings.noTrainingHistory,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            else
              // --------------------------------------------------
              // TRAINING LIST
              // --------------------------------------------------

              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: trainingHistory.length,
                  itemBuilder: (context, index) {
                    final record = trainingHistory[index];

                    return _buildTrainingRecord(record);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // TRAINING RECORD
  // --------------------------------------------------

  Widget _buildTrainingRecord(
    TrainingRecord record,
  ) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        childrenPadding: const EdgeInsets.only(
          left: 20,
          right: 8,
          bottom: 12,
        ),
        iconColor: AppColors.textSecondary,
        collapsedIconColor: AppColors.textSecondary,
        title: Text(
          _formatDate(record.completedAt),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+${record.xpGained} XP',
              style: const TextStyle(
                color: AppColors.warning,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
        children: [
          ...record.exercises.map(
            (exercise) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.fitness_center,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise.exerciseId,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            exercise.description,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}