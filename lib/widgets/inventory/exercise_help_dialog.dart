import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_settings.dart';
import '../../data/exercises.dart';
import '../../localization/language.dart';
import '../../models/equipment_item.dart';
import '../../models/exercise.dart';
import '../../models/exercise_guide.dart';
import '../../services/exercise_guide_service.dart';

class ExerciseHelpDialog extends StatefulWidget {
  final EquipmentItem item;
  final AppSettings settings;
  final ExerciseGuideService? guideService;

  const ExerciseHelpDialog({
    super.key,
    required this.item,
    required this.settings,
    this.guideService,
  });

  @override
  State<ExerciseHelpDialog> createState() => _ExerciseHelpDialogState();
}

class _ExerciseHelpDialogState extends State<ExerciseHelpDialog> {
  late final ExerciseGuideService _guideService;
  late final bool _ownsGuideService;

  int? _selectedExerciseIndex;
  ExerciseGuide? _selectedGuide;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _ownsGuideService = widget.guideService == null;
    _guideService = widget.guideService ?? ExerciseGuideService();
  }

  @override
  void dispose() {
    if (_ownsGuideService) {
      _guideService.dispose();
    }

    super.dispose();
  }

  Future<void> _selectExercise(int index) async {
    final equipmentExercise = widget.item.exercises[index];

    setState(() {
      _selectedExerciseIndex = index;
      _selectedGuide = null;
      _isLoading = true;
    });

    try {
      final guide = await _guideService.getExerciseGuide(
        exerciseId: equipmentExercise.exerciseId,
        language: _languageCode,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _selectedGuide = guide;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _selectedGuide = null;
        _isLoading = false;
      });
    }
  }

  void _backToExerciseList() {
    setState(() {
      _selectedExerciseIndex = null;
      _selectedGuide = null;
      _isLoading = false;
    });
  }

  Exercise? _findExercise(String exerciseId) {
    for (final exercise in exercises) {
      if (exercise.id == exerciseId) {
        return exercise;
      }
    }

    return null;
  }

  String _exerciseName(String exerciseId) {
    final exercise = _findExercise(exerciseId);

    return exercise?.name ?? widget.settings.strings.unknownExercise;
  }

  String get _languageCode {
    switch (widget.settings.language) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.spanish:
        return 'es';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 420,
          maxHeight: 600,
        ),
        child: _selectedExerciseIndex == null
            ? _buildExerciseList()
            : _buildExerciseDetail(),
      ),
    );
  }

  Widget _buildExerciseList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: widget.settings.strings.exerciseGuide,
            onBack: null,
          ),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.item.exercises.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (_, index) {
                final equipmentExercise = widget.item.exercises[index];

                return _buildExerciseListTile(
                  index: index,
                  exerciseName: _exerciseName(
                    equipmentExercise.exerciseId,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildCloseButton(),
        ],
      ),
    );
  }

  Widget _buildExerciseListTile({
    required int index,
    required String exerciseName,
  }) {
    return InkWell(
      onTap: () => _selectExercise(index),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.surfaceLight,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                exerciseName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseDetail() {
    final exerciseIndex = _selectedExerciseIndex!;
    final equipmentExercise = widget.item.exercises[exerciseIndex];

    final valquinExerciseName = _exerciseName(
      equipmentExercise.exerciseId,
    );

    final guideName = _selectedGuide?.name.trim() ?? '';

    final title = guideName.isNotEmpty
        ? guideName
        : valquinExerciseName;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: title,
            onBack: _backToExerciseList,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? _buildLoadingState()
                : _buildGuideContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 12),
          Text(
            widget.settings.strings.exerciseGuideLoading,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideContent() {
    final guide = _selectedGuide;

    if (guide == null) {
      return Center(
        child: Text(
          widget.settings.strings.exerciseGuideUnavailable,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      );
    }

    final hasImage =
        guide.imageUrl != null && guide.imageUrl!.isNotEmpty;

    final hasDescription = guide.description.isNotEmpty;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasImage) ...[
            _buildExerciseImage(guide.imageUrl!),
            const SizedBox(height: 16),
          ],
          if (hasDescription)
            Text(
              guide.description,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                height: 1.5,
              ),
            )
          else
            Text(
              widget.settings.strings.exerciseGuideUnavailable,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExerciseImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          loadingBuilder: (
            context,
            child,
            loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (_, _, _) {
            return const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.textDisabled,
                size: 36,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader({
    required String title,
    required VoidCallback? onBack,
  }) {
    return Row(
      children: [
        if (onBack != null) ...[
          IconButton(
            onPressed: onBack,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(
          widget.settings.strings.close,
          style: TextStyle(
            color: widget.settings.accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}