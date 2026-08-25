import '../../data/exercises.dart';
import '../app_database.dart';

class ExerciseSeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final exercise in exercises) {
      await database.insertExercise(
        id: exercise.id,
        name: exercise.name,
      );

      for (final variant in exercise.variants) {
        final variantId =
            await database.insertExerciseVariant(
          variantIndex: variant.index,
          sets: variant.sets,
          amount: variant.amount,
          unit: variant.unit,
        );

        await database.insertExerciseVariantLink(
          exerciseId: exercise.id,
          variantId: variantId,
        );
      }
    }
  }
}
