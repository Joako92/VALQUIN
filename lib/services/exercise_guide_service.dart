import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/wger_exercise_ids.dart';
import '../models/exercise_guide.dart';

class ExerciseGuideService {
  static const String _baseUrl =
      'https://wger.de/api/v2/exerciseinfo';

  static const int _englishLanguageId = 2;
  static const int _spanishLanguageId = 4;

  final http.Client _client;

  final Map<String, ExerciseGuide> _cache = {};

  ExerciseGuideService({http.Client? client})
      : _client = client ?? http.Client();

  Future<ExerciseGuide?> getExerciseGuide({
    required String exerciseId,
    required String language,
  }) async {
    final cacheKey = '$exerciseId:$language';

    final cachedGuide = _cache[cacheKey];

    if (cachedGuide != null) {
      return cachedGuide;
    }

    final wgerId = getWgerExerciseId(exerciseId);

    if (wgerId == null) {
      return null;
    }

    final uri = Uri.parse('$_baseUrl/$wgerId/');

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load WGER exercise: ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    final languageId = language == 'es'
        ? _spanishLanguageId
        : _englishLanguageId;

    final translations = data['translations'] as List<dynamic>? ?? [];

    Map<String, dynamic>? translation;

    for (final item in translations) {
      final current = item as Map<String, dynamic>;

      if (current['language'] == languageId) {
        translation = current;
        break;
      }
    }

    translation ??= _findTranslation(
      translations,
      _englishLanguageId,
    );

    final name = translation?['name'] as String? ?? '';

    final description =
        translation?['description'] as String? ?? '';

    final imageUrl = _getImageUrl(data);

    if (name.isEmpty && description.isEmpty && imageUrl == null) {
      return null;
    }

    final guide = ExerciseGuide(
      exerciseId: exerciseId,
      wgerId: wgerId,
      name: name,
      description: _cleanDescription(description),
      imageUrl: imageUrl,
    );

    _cache[cacheKey] = guide;

    return guide;
  }

  Map<String, dynamic>? _findTranslation(
    List<dynamic> translations,
    int languageId,
  ) {
    for (final item in translations) {
      final current = item as Map<String, dynamic>;

      if (current['language'] == languageId) {
        return current;
      }
    }

    return null;
  }

  String? _getImageUrl(Map<String, dynamic> data) {
    final images = data['images'] as List<dynamic>?;

    if (images == null || images.isEmpty) {
      return null;
    }

    final firstImage = images.first as Map<String, dynamic>;

    return firstImage['image'] as String?;
  }

  String _cleanDescription(String description) {
    return description
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .trim();
  }

  void dispose() {
    _client.close();
  }
}