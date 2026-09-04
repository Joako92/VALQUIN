import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_icons.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../managers/class_manager.dart';
import '../widgets/valquin_icon.dart';
import 'player_screen.dart';
import 'inventory_screen.dart';
import 'equip_screen.dart';

class MainScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;

  const MainScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      PlayerScreen(
        playerManager: widget.playerManager,
        classManager: widget.classManager,
      ),
      InventoryScreen(
        playerManager: widget.playerManager,
        trainingPlanManager: widget.trainingPlanManager,
        database: widget.database,
      ),
      EquipScreen(
        playerManager: widget.playerManager,
        trainingPlanManager: widget.trainingPlanManager,
        database: widget.database,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.surface,
          indicatorColor:
              AppColors.accent.withValues(alpha: 0.2),

          // No labels.
          labelTextStyle:
              const WidgetStatePropertyAll<TextStyle>(
            TextStyle(
              fontSize: 0,
              color: Colors.transparent,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,

          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          destinations: [
            NavigationDestination(
              icon: ValquinIcon(
                AppIcons.status,
                size: 60,
                color: AppColors.textSecondary,
              ),
              selectedIcon: ValquinIcon(
                AppIcons.status,
                size: 70,
                color: AppColors.accent,
              ),
              label: '',
            ),

            NavigationDestination(
              icon: ValquinIcon(
                AppIcons.inventory,
                size: 60,
                color: AppColors.textSecondary,
              ),
              selectedIcon: ValquinIcon(
                AppIcons.inventory,
                size: 70,
                color: AppColors.accent,
              ),
              label: '',
            ),

            NavigationDestination(
              icon: ValquinIcon(
                AppIcons.equipment,
                size: 60,
                color: AppColors.textSecondary,
              ),
              selectedIcon: ValquinIcon(
                AppIcons.equipment,
                size: 70,
                color: AppColors.accent,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}