import '../../data/exercises.dart';
import '../app_database.dart';

class ExerciseSeeder {
  static Future<void> seed(AppDatabase database) async {
    for (final exercise in exercises) {
      await database.replaceExercise(
        id: exercise.id,
        name: exercise.name,
        variants: exercise.variants,
      );
    }
  }
}
