import 'exercise_variant.dart';

class VariantFamily {
  final String id;
  final String name;
  final String unit;
  final List<ExerciseVariant> variants;

  const VariantFamily({
    required this.id,
    required this.name,
    required this.unit,
    required this.variants,
  });
}