class ExerciseGuide {
  final String exerciseId;
  final int wgerId;
  final String name;
  final String description;
  final String? imageUrl;

  const ExerciseGuide({
    required this.exerciseId,
    required this.wgerId,
    required this.name,
    required this.description,
    this.imageUrl,
  });
}