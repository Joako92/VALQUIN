import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../managers/class_manager.dart';
import '../widgets/valquin_icon.dart';
import '../widgets/valquin_background.dart';
import 'player_screen.dart';
import 'inventory_screen.dart';
import 'equip_screen.dart';
import '../config/app_settings.dart';

class MainScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final ClassManager classManager;
  final AppDatabase database;
  final AppSettings settings;

  const MainScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.classManager,
    required this.database,
    required this.settings,
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
        settings: widget.settings,
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
      backgroundColor: Colors.transparent,
      body: ValquinBackground(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: SizedBox(
          height: 125,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Decorative stone navigation plate
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Nav.png',
                  fit: BoxFit.fill,
                ),
              ),

              // Navigation icons
              Positioned(
                left: 45,
                right: 45,
                bottom: 0,
                height: 105,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    backgroundColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelTextStyle:
                        const WidgetStatePropertyAll<TextStyle>(
                      TextStyle(
                        fontSize: 0,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: NavigationBar(
                    height: 85,
                    backgroundColor: Colors.transparent,
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
                          color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: '',
                      ),
                    ],
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