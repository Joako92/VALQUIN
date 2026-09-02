import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/exercise.dart';
import '../models/training_plan.dart';

enum InventoryFilterType {
  all,
  equipped,
  slot,
}

class InventoryScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppDatabase database;

  const InventoryScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.database,
  });

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppDatabase get database => widget.database;

  InventoryFilterType selectedFilter = InventoryFilterType.all;

  EquipmentSlot? selectedSlot;

  EquipmentItem? selectedItem;

  List<EquipmentItem> equipmentItems = [];

  Map<String, Exercise> exercisesById = {};

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEquipmentItems();
  }

  Future<void> loadEquipmentItems() async {
    final items = await database.getEquipmentItemsWithAllData();

    final exercises = await database.getExercisesWithVariants();

    if (!mounted) return;

    setState(() {
      equipmentItems = items;

      exercisesById = {
        for (final exercise in exercises) exercise.id: exercise,
      };

      isLoading = false;

      if (items.isNotEmpty) {
        selectedItem = items.first;
      }
    });
  }

  // ─────────────────────────────────────────────
  // FILTERING
  // ─────────────────────────────────────────────

  List<EquipmentItem> get unlockedItems {
    final player = playerManager.player;

    if (player == null) {
      return [];
    }

    return equipmentItems
        .where(
          (item) => trainingPlanManager.trainingPlan
              .isItemUnlocked(item, player),
        )
        .toList();
  }

  List<EquipmentItem> get filteredItems {
    final trainingPlan = trainingPlanManager.trainingPlan;

    switch (selectedFilter) {
      case InventoryFilterType.all:
        return unlockedItems;

      case InventoryFilterType.equipped:
        return unlockedItems
            .where(
              (item) => trainingPlan.containsItem(item),
            )
            .toList();

      case InventoryFilterType.slot:
        return unlockedItems
            .where(
              (item) => item.slot == selectedSlot,
            )
            .toList();
    }
  }

  void selectAll() {
    setState(() {
      selectedFilter = InventoryFilterType.all;
      selectedSlot = null;
    });
  }

  void selectEquipped() {
    setState(() {
      selectedFilter = InventoryFilterType.equipped;
      selectedSlot = null;
    });
  }

  void selectSlot(EquipmentSlot slot) {
    setState(() {
      selectedFilter = InventoryFilterType.slot;
      selectedSlot = slot;
    });
  }

  // ─────────────────────────────────────────────
  // RARITY
  // ─────────────────────────────────────────────

  Color rarityColor(EquipmentItem item) {
    switch (item.rarity.name.toLowerCase()) {
      case 'rare':
        return AppColors.rare;

      case 'legendary':
        return AppColors.legendary;

      case 'mythic':
        return AppColors.mythic;

      case 'common':
      default:
        return AppColors.common;
    }
  }

  Color rarityGlowColor(EquipmentItem item) {
    switch (item.rarity.name.toLowerCase()) {
      case 'rare':
        return AppColors.rareGlow;

      case 'legendary':
        return AppColors.legendaryGlow;

      case 'mythic':
        return AppColors.mythicGlow;

      case 'common':
      default:
        return AppColors.commonGlow;
    }
  }

  // ─────────────────────────────────────────────
  // ICONS
  // ─────────────────────────────────────────────

  IconData slotIcon(EquipmentSlot slot) {
    switch (slot) {
      case EquipmentSlot.shoulders:
        return AppIcons.shoulders;

      case EquipmentSlot.head:
        return AppIcons.head;

      case EquipmentSlot.wings:
        return AppIcons.wings;

      case EquipmentSlot.weapon:
        return AppIcons.weapon;

      case EquipmentSlot.chest:
        return AppIcons.chest;

      case EquipmentSlot.shield:
        return AppIcons.shield;

      case EquipmentSlot.accessory:
        return AppIcons.accessory;

      case EquipmentSlot.legs:
        return AppIcons.legs;

      case EquipmentSlot.belt:
        return AppIcons.belt;
    }
  }

  // ─────────────────────────────────────────────
  // FORMATTING
  // ─────────────────────────────────────────────

  String formatAmount(double amount) {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }

    return amount.toString();
  }

  String formatEquipRequirement(EquipmentItem item) {
    final requirements = item.equipRequirements;
    final parts = <String>[];

    if (requirements.level != null) {
      parts.add('LEVEL: ${requirements.level}');
    }

    requirements.stats.forEach((stat, value) {
      parts.add('${stat.toUpperCase()}: $value');
    });

    return parts.isEmpty ? 'NONE' : parts.join(' • ');
  }

  String formatExercise(
    EquipmentItem item,
    int index,
  ) {
    final equipmentExercise = item.exercises[index];

    final exercise =
        exercisesById[equipmentExercise.exerciseId];

    if (exercise == null) {
      return 'UNKNOWN EXERCISE';
    }

    final variant = exercise.getVariant(
      equipmentExercise.maxVariant,
    );

    final amount = formatAmount(variant.amount);

    if (variant.sets != null) {
      return '${exercise.name} — '
          '${variant.sets} x '
          '$amount '
          '${variant.unit}';
    }

    return '${exercise.name} — '
        '$amount '
        '${variant.unit}';
  }

  // ─────────────────────────────────────────────
  // ITEM DETAIL
  // ─────────────────────────────────────────────

  Widget buildItemDetail(
    BuildContext context,
    EquipmentItem item,
  ) {
    final player = playerManager.player;
    final trainingPlan = trainingPlanManager.trainingPlan;

    final rarity = rarityColor(item);
    final glow = rarityGlowColor(item);

    final isEquipped = trainingPlan.containsItem(item);

    final canEquip = player != null &&
        trainingPlan.canEquipItem(
          item,
          player,
        );

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─────────────────────────────────────
          // ITEM ICON
          // ─────────────────────────────────────

          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: rarity.withValues(alpha: 0.7),
              ),
              boxShadow: [
                BoxShadow(
                  color: glow.withValues(alpha: 0.65),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              slotIcon(item.slot),
              size: 52,
              color: rarity,
            ),
          ),

          const SizedBox(width: 16),

          // ─────────────────────────────────────
          // ITEM INFORMATION
          // ─────────────────────────────────────

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.rarity.name.toUpperCase(),
                  style: TextStyle(
                    color: rarity,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'EXERCISES',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 4),

                ...List.generate(
                  item.exercises.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Text(
                      '• ${formatExercise(item, index)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'REQUIREMENTS',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  formatEquipRequirement(item),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 34,
                  child: ElevatedButton(
                    onPressed: canEquip || isEquipped
                        ? () => handleEquip(item)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rarity,
                      foregroundColor: AppColors.background,
                      disabledBackgroundColor:
                          AppColors.surfaceLight,
                      disabledForegroundColor:
                          AppColors.textDisabled,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    child: Text(
                      isEquipped ? 'UNEQUIP' : 'EQUIP',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // EQUIP / UNEQUIP
  // ─────────────────────────────────────────────

  Future<void> handleEquip(
    EquipmentItem item,
  ) async {
    final player = playerManager.player;

    if (player == null) return;

    final trainingPlan = trainingPlanManager.trainingPlan;

    final isEquipped = trainingPlan.containsItem(item);

    if (isEquipped) {
      final removed = trainingPlan.removeItem(item);

      if (!removed) {
        if (!mounted) return;

        showMessage(
          '${item.name} IS ON COOLDOWN',
        );

        return;
      }

      await trainingPlanManager.saveTrainingPlan();

      if (!mounted) return;

      setState(() {});

      showMessage(
        'UNEQUIPPED ${item.name}',
      );

      return;
    }

    final result = trainingPlan.addItem(
      item,
      player,
    );

    switch (result.type) {
      case EquipResultType.equipped:
        await trainingPlanManager.saveTrainingPlan();

        if (!mounted) return;

        setState(() {});

        showMessage(
          'EQUIPPED ${item.name}',
        );

        break;

      case EquipResultType.replaced:
        await trainingPlanManager.saveTrainingPlan();

        if (!mounted) return;

        setState(() {});

        showMessage(
          'REPLACED '
          '${result.item!.name} '
          '→ ${item.name}',
        );

        break;

      case EquipResultType.blockedByCooldown:
        if (!mounted) return;

        showMessage(
          '${result.item!.name} IS ON COOLDOWN',
        );

        break;

      case EquipResultType.blockedByUnlockRequirement:
        if (!mounted) return;

        showMessage(
          '${item.name}: '
          'UNLOCK REQUIREMENTS NOT MET',
        );

        break;

      case EquipResultType.blockedByEquipRequirement:
        if (!mounted) return;

        showMessage(
          '${item.name}: '
          'EQUIP REQUIREMENTS NOT MET',
        );

        break;
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppColors.surface,
          content: Text(
            message,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }

  // ─────────────────────────────────────────────
  // ITEM GRID
  // ─────────────────────────────────────────────

  Widget buildItemGrid() {
    final items = filteredItems;
    final trainingPlan = trainingPlanManager.trainingPlan;

    if (items.isEmpty) {
      return const Center(
        child: Text(
          'NO ITEMS',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        16,
        8,
        16,
        8,
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.82,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        final rarity = rarityColor(item);
        final glow = rarityGlowColor(item);

        final isSelected = selectedItem == item;
        final isEquipped =
            trainingPlan.containsItem(item);

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = item;
            });
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? rarity
                          : AppColors.border,
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: glow.withValues(
                          alpha: isSelected
                              ? 0.45
                              : 0.15,
                        ),
                        blurRadius:
                            isSelected ? 14 : 7,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          slotIcon(item.slot),
                          size: 38,
                          color: rarity,
                        ),
                      ),

                      if (isEquipped)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Icon(
                            AppIcons.selected,
                            size: 15,
                            color: rarity,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  // FILTER BAR
  // ─────────────────────────────────────────────

  Widget buildFilterBar() {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        children: [
          buildFilter(
            label: 'ALL',
            selected:
                selectedFilter == InventoryFilterType.all,
            onTap: selectAll,
          ),
          buildFilter(
            label: 'EQUIPPED',
            selected:
                selectedFilter ==
                    InventoryFilterType.equipped,
            onTap: selectEquipped,
          ),
          buildFilter(
            label: 'SHOULDERS',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.shoulders,
            onTap: () => selectSlot(
              EquipmentSlot.shoulders,
            ),
          ),
          buildFilter(
            label: 'HEAD',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.head,
            onTap: () => selectSlot(
              EquipmentSlot.head,
            ),
          ),
          buildFilter(
            label: 'WINGS',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.wings,
            onTap: () => selectSlot(
              EquipmentSlot.wings,
            ),
          ),
          buildFilter(
            label: 'WEAPON',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.weapon,
            onTap: () => selectSlot(
              EquipmentSlot.weapon,
            ),
          ),
          buildFilter(
            label: 'CHEST',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.chest,
            onTap: () => selectSlot(
              EquipmentSlot.chest,
            ),
          ),
          buildFilter(
            label: 'SHIELD',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.shield,
            onTap: () => selectSlot(
              EquipmentSlot.shield,
            ),
          ),
          buildFilter(
            label: 'ACCESSORY',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.accessory,
            onTap: () => selectSlot(
              EquipmentSlot.accessory,
            ),
          ),
          buildFilter(
            label: 'LEGS',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.legs,
            onTap: () => selectSlot(
              EquipmentSlot.legs,
            ),
          ),
          buildFilter(
            label: 'BELT',
            selected:
                selectedFilter ==
                        InventoryFilterType.slot &&
                    selectedSlot ==
                        EquipmentSlot.belt,
            onTap: () => selectSlot(
              EquipmentSlot.belt,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.surfaceLight
                : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected
                  ? AppColors.textPrimary
                  : AppColors.border,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null || isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.accent,),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // SELECTED ITEM
            if (selectedItem != null)
              buildItemDetail(
                context,
                selectedItem!,
              ),

            // INVENTORY GRID
            Expanded(
              child: buildItemGrid(),
            ),

            // FILTERS
            buildFilterBar(),
          ],
        ),
      ),
    );
  }
}
