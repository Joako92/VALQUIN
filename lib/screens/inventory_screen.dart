import 'dart:async';

import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../config/app_settings.dart';

import '../database/app_database.dart';
import '../managers/player_manager.dart';
import '../managers/training_plan_manager.dart';
import '../models/equipment_item.dart';
import '../models/equipment_slot.dart';
import '../models/exercise.dart';
import '../models/variant_family.dart';
import '../models/training_plan.dart';

import '../widgets/valquin_info_dialog.dart';

import '../widgets/inventory/inventory_filter_bar.dart';
import '../widgets/inventory/inventory_item_grid.dart';
import '../widgets/inventory/inventory_item_detail.dart';

class InventoryScreen extends StatefulWidget {
  final PlayerManager playerManager;
  final TrainingPlanManager trainingPlanManager;
  final AppDatabase database;
  final AppSettings settings;

  const InventoryScreen({
    super.key,
    required this.playerManager,
    required this.trainingPlanManager,
    required this.database,
    required this.settings,
  });

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  PlayerManager get playerManager => widget.playerManager;

  TrainingPlanManager get trainingPlanManager =>
      widget.trainingPlanManager;

  AppDatabase get database => widget.database;

  AppSettings get settings => widget.settings;

  InventoryFilterType selectedFilter = InventoryFilterType.all;

  EquipmentSlot? selectedSlot;

  EquipmentItem? selectedItem;

  /// Selected variant for each equipment item.
  ///
  /// The value is zero-based:
  /// 0 = variant 1
  /// 1 = variant 2
  /// 2 = variant 3
  final Map<String, int> selectedVariants = {};

  List<EquipmentItem> equipmentItems = [];

  Map<String, Exercise> exercisesById = {};

  Map<String, VariantFamily> variantFamiliesById = {};

  bool isLoading = true;

  Timer? _cooldownTimer;

  // --------------------------------------------------
  // INIT
  // --------------------------------------------------

  @override
  void initState() {
    super.initState();

    loadEquipmentItems();

    _cooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
          setState(() {});
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInventoryInfoIfNeeded();
    });
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  // --------------------------------------------------
  // INFO DIALOG
  // --------------------------------------------------

  void _showInventoryInfoIfNeeded() {
    final player = playerManager.player;

    if (!mounted || player == null || player.xp != 0) {
      return;
    }

    showDialog(
      context: context,
      builder: (_) {
        return ValquinInfoDialog(
          title: settings.strings.inventoryInfoTitle,
          message: settings.strings.inventoryInfoMessage,
          buttonText: settings.strings.gotIt,
        );
      },
    );
  }

  // --------------------------------------------------
  // DATA
  // --------------------------------------------------

  Future<void> loadEquipmentItems() async {
    final items = await database.getEquipmentItemsWithAllData();

    final exercises =
        await database.select(database.exercises).get();

    final variantFamilies =
        await database.getVariantFamiliesWithVariants();

    if (!mounted) {
      return;
    }

    setState(() {
      equipmentItems = items;

      exercisesById = { for (final row in exercises) row.id: Exercise( id: row.id, name: row.name, ), };

      variantFamiliesById = {
        for (final family in variantFamilies) family.id: family,
      };

      isLoading = false;

      if (items.isNotEmpty) {
        selectedItem = items.first;
      }
    });
  }

  // --------------------------------------------------
  // FILTERING
  // --------------------------------------------------

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

  // --------------------------------------------------
  // COOLDOWN
  // --------------------------------------------------

  bool isOnCooldown(EquipmentItem item) {
    return trainingPlanManager.trainingPlan.isOnCooldown(item);
  }

  Duration? cooldownRemaining(EquipmentItem item) {
    return trainingPlanManager.trainingPlan
        .cooldownUntil(item)
        ?.difference(DateTime.now());
  }

  // --------------------------------------------------
  // FORMATTING
  // --------------------------------------------------

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
      parts.add('${settings.strings.level}: ${requirements.level}');
    }

    requirements.stats.forEach((stat, value) {
      parts.add('${formatStatName(stat)}: $value');
    });

    return parts.isEmpty ? settings.strings.none : parts.join(' • ');
  }

  String formatStatName(String stat) {
    switch (stat.toLowerCase()) {
      case 'strength':
        return settings.strings.attributeStrength;

      case 'endurance':
        return settings.strings.attributeEndurance;

      case 'energy':
        return settings.strings.attributeEnergy;

      case 'stamina':
        return settings.strings.attributeStamina;

      default:
        return stat.toUpperCase();
    }
  }

  // --------------------------------------------------
  // VARIANTS
  // --------------------------------------------------

  int selectedVariantFor(EquipmentItem item) {
    return selectedVariants[item.id] ?? 0;
  }

  int availableVariantCount(EquipmentItem item) {
    if (item.exercises.isEmpty) {
      return 1;
    }

    return item.exercises.first.maxVariant + 1;
  }

  void selectVariant(
    EquipmentItem item,
    int variantIndex,
  ) {
    setState(() {
      selectedVariants[item.id] = variantIndex;
    });
  }

  // --------------------------------------------------
  // EXERCISE DATA
  // --------------------------------------------------

  String exerciseDetail(
    EquipmentItem item,
    int index,
  ) {
    final equipmentExercise = item.exercises[index];

    final exercise =
        exercisesById[equipmentExercise.exerciseId];

    if (exercise == null) {
      return settings.strings.unknownExercise;
    }

    final family =
        variantFamiliesById[equipmentExercise.variantFamilyId];

    if (family == null || family.variants.isEmpty) {
      return settings.strings.unknownExercise;
    }

    final selectedVariant = selectedVariantFor(item);

    final variantIndex = selectedVariant <=
            equipmentExercise.maxVariant
        ? selectedVariant
        : equipmentExercise.maxVariant;

    final variant = family.variants.firstWhere(
      (variant) => variant.index == variantIndex,
      orElse: () => family.variants.last,
    );

    final amount = formatAmount(variant.amount);

    return variant.sets != null
        ? '${exercise.name} → '
            '${variant.sets} x $amount ${family.unit}'
        : '${exercise.name} → '
            '$amount ${family.unit}';
  }

  // --------------------------------------------------
  // EQUIP / UNEQUIP
  // --------------------------------------------------

  Future<void> handleEquip(
    EquipmentItem item,
  ) async {
    final player = playerManager.player;

    if (player == null) {
      return;
    }

    final trainingPlan = trainingPlanManager.trainingPlan;

    final isEquipped = trainingPlan.containsItem(item);

    if (isEquipped) {
      final removed = trainingPlan.removeItem(item);

      if (!removed) {
        if (!mounted) {
          return;
        }

        showMessage(
          '${item.name} ${settings.strings.isOnCooldown}',
        );

        return;
      }

      await trainingPlanManager.saveTrainingPlan();

      if (!mounted) {
        return;
      }

      setState(() {});

      showMessage(
        '${settings.strings.unequipped} ${item.name}',
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

        if (!mounted) {
          return;
        }

        setState(() {});

        showMessage(
          '${settings.strings.equippedMessage} ${item.name}',
        );

        break;

      case EquipResultType.replaced:
        await trainingPlanManager.saveTrainingPlan();

        if (!mounted) {
          return;
        }

        setState(() {});

        showMessage(
          '${settings.strings.replaced} '
          '${result.item!.name} '
          '→ ${item.name}',
        );

        break;

      case EquipResultType.blockedByCooldown:
        if (!mounted) {
          return;
        }

        showMessage(
          '${result.item!.name} ${settings.strings.isOnCooldown}',
        );

        break;

      case EquipResultType.blockedByUnlockRequirement:
        if (!mounted) {
          return;
        }

        showMessage(
          '${item.name}: '
          '${settings.strings.unlockRequirementsNotMet}',
        );

        break;

      case EquipResultType.blockedByEquipRequirement:
        if (!mounted) {
          return;
        }

        showMessage(
          '${item.name}: '
          '${settings.strings.equipRequirementsNotMet}',
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

  // --------------------------------------------------
  // BUILD
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final player = playerManager.player;

    if (player == null || isLoading) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            if (selectedItem != null)
              InventoryItemDetail(
                item: selectedItem!,
                playerManager: playerManager,
                trainingPlanManager: trainingPlanManager,
                settings: settings,
                selectedVariantFor: selectedVariantFor,
                availableVariantCount: availableVariantCount,
                onVariantSelected: selectVariant,
                exerciseDetail: exerciseDetail,
                formatEquipRequirement: formatEquipRequirement,
                cooldownRemaining: cooldownRemaining,
                isOnCooldown: isOnCooldown,
                onEquip: handleEquip,
              ),

            Expanded(
              child: InventoryItemGrid(
                items: filteredItems,
                trainingPlanManager: trainingPlanManager,
                selectedItem: selectedItem,
                settings: settings,
                cooldownRemaining: cooldownRemaining,
                isOnCooldown: isOnCooldown,
                cooldownLabel: settings.strings.cooldown,
                onItemSelected: (item) {
                  setState(() {
                    selectedItem = item;
                  });
                },
              ),
            ),

            InventoryFilterBar(
              selectedFilter: selectedFilter,
              selectedSlot: selectedSlot,
              settings: settings,
              onSelectAll: selectAll,
              onSelectEquipped: selectEquipped,
              onSelectSlot: selectSlot,
            ),
          ],
        ),
      ),
    );
  }
}
