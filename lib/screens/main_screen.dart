import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../managers/class_manager.dart';
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
          indicatorColor: AppColors.accent.withValues(alpha: 0.2),

          labelTextStyle:
              WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                );
              }

              return const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
              );
            },
          ),

          iconTheme:
              WidgetStateProperty.resolveWith<IconThemeData>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: AppColors.accent,
                );
              }

              return const IconThemeData(
                color: AppColors.textSecondary,
              );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
              ),
              selectedIcon: Icon(
                Icons.person,
              ),
              label: 'STATUS',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.inventory_2_outlined,
              ),
              selectedIcon: Icon(
                Icons.inventory_2,
              ),
              label: 'INVENTORY',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shield_outlined,
              ),
              selectedIcon: Icon(
                Icons.shield,
              ),
              label: 'EQUIP',
            ),
          ],
        ),
      ),
    );
  }
}
