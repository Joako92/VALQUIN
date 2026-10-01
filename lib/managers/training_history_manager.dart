import '../database/app_database.dart';
import '../models/training_record.dart';

class TrainingHistoryManager {
  final AppDatabase database;

  TrainingHistoryManager({
    required this.database,
  });

  Future<List<TrainingRecord>> getRecentHistory({
    int limit = 10,
  }) {
    return database.getRecentTrainingHistory(
      limit: limit,
    );
  }
}