import 'package:shared_preferences/shared_preferences.dart';

class TrainingPlanStorage {
  static const String _equipmentKey =
      'training_plan_equipment';

  static const String _activeSlotsKey =
      'training_plan_active_slots';

  static const String _cooldownsKey =
      'training_plan_cooldowns';
  
  static const String _selectedVariantsKey =
    'training_plan_selected_variants';

  // --------------------------------------------------
  // SAVE
  // --------------------------------------------------

  Future<void> saveTrainingPlan({
    required List<String> equipmentIds,
    required List<String> activeSlots,
    required Map<String, DateTime> cooldowns,
    required Map<String, int> selectedVariants,
  }) async {
    final preferences =
        await SharedPreferences.getInstance();

    // --------------------------------------------------
    // EQUIPMENT
    // --------------------------------------------------

    await preferences.setStringList(
      _equipmentKey,
      equipmentIds,
    );

    // --------------------------------------------------
    // ACTIVE SLOTS
    // --------------------------------------------------

    await preferences.setStringList(
      _activeSlotsKey,
      activeSlots,
    );

    // --------------------------------------------------
    // COOLDOWNS
    // --------------------------------------------------

    final cooldownData = cooldowns.map(
      (id, dateTime) => MapEntry(
        id,
        dateTime.millisecondsSinceEpoch.toString(),
      ),
    );

    await preferences.setString(
      _cooldownsKey,
      _encodeMap(cooldownData),
    );

    // --------------------------------------------------
    // VARIANTS
    // --------------------------------------------------

    final selectedVariantData = selectedVariants.map(
      (id, variantIndex) => MapEntry(
        id,
        variantIndex.toString(),
      ),
    );

    await preferences.setString(
      _selectedVariantsKey,
      _encodeMap(selectedVariantData),
    );
  }

  // --------------------------------------------------
  // LOAD
  // --------------------------------------------------

  Future<Map<String, dynamic>> loadTrainingPlan() async {
    final preferences =
        await SharedPreferences.getInstance();

    final equipmentIds =
        preferences.getStringList(
              _equipmentKey,
            ) ??
            [];

    final activeSlots =
        preferences.getStringList(
              _activeSlotsKey,
            ) ??
            [];

    final cooldownData =
        preferences.getString(
      _cooldownsKey,
    );

    final selectedVariantData =
        preferences.getString(
      _selectedVariantsKey,
    );

    return {
      'equipmentIds': equipmentIds,
      'activeSlots': activeSlots,
      'cooldowns': _decodeMap(cooldownData),
      'selectedVariants': _decodeMap(selectedVariantData),
    };
  }

  // --------------------------------------------------
  // ENCODE
  // --------------------------------------------------

  String _encodeMap(
    Map<String, String> map,
  ) {
    return map.entries
        .map(
          (entry) =>
              '${entry.key}=${entry.value}',
        )
        .join('|');
  }

  // --------------------------------------------------
  // DECODE
  // --------------------------------------------------

  Map<String, String> _decodeMap(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return {};
    }

    final result = <String, String>{};

    for (final entry in value.split('|')) {
      final separator = entry.indexOf('=');

      if (separator == -1) {
        continue;
      }

      final key = entry.substring(
        0,
        separator,
      );

      final timestamp = entry.substring(
        separator + 1,
      );

      result[key] = timestamp;
    }

    return result;
  }
}