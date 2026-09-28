import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class InventoryCooldownOverlay extends StatelessWidget {
  final Duration? cooldownRemaining;
  final String cooldownLabel;

  const InventoryCooldownOverlay({
    super.key,
    required this.cooldownRemaining,
    required this.cooldownLabel,
  });

  String _formatCooldown(Duration? duration) {
    if (duration == null || duration.isNegative) {
      return '00:00';
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.lock_clock,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(height: 2),
              Text(
                cooldownLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _formatCooldown(cooldownRemaining),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}