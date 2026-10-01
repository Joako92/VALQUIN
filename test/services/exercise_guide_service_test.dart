import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:valquin/services/exercise_guide_service.dart';

import 'package:valquin/data/wger_exercise_ids.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class FakeHttpClient extends http.BaseClient {
  int requestCount = 0;

  final String responseBody;

  FakeHttpClient(this.responseBody);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    requestCount++;

    return http.StreamedResponse(
      Stream.value(utf8.encode(responseBody)),
      200,
      request: request,
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}

void main() {
  test('uses cache for repeated requests', () async {
    final client = FakeHttpClient(
      jsonEncode({
        'translations': [
          {
            'language': 4,
            'name': 'Flexión',
            'description': '<p>Descripción en español</p>',
          },
          {
            'language': 2,
            'name': 'Push-Up',
            'description': '<p>English description</p>',
          },
        ],
        'images': [],
      }),
    );

    final service = ExerciseGuideService(client: client);

    final firstGuide = await service.getExerciseGuide(
      exerciseId: 'flexiones_brazos',
      language: 'es',
    );

    final secondGuide = await service.getExerciseGuide(
      exerciseId: 'flexiones_brazos',
      language: 'es',
    );

    expect(firstGuide, isNotNull);
    expect(secondGuide, isNotNull);

    expect(client.requestCount, 1);
    expect(identical(firstGuide, secondGuide), isTrue);

    service.dispose();
  });
  test(
    'loads exercise guide from WGER',
    () async {
      final service = ExerciseGuideService();

      for (final exerciseId in wgerExerciseIds.keys) {
        final guide = await service.getExerciseGuide(
          exerciseId: exerciseId,
          language: 'es',
        );

        debugPrint(
          '$exerciseId → '
          '${guide?.name ?? 'NO NAME'} | '
          '${guide?.imageUrl != null ? 'IMAGE' : 'NO IMAGE'}',
        );
      }

      debugPrint('\n--- ENGLISH ---');

      const englishTestExercises = [
        'caminata',
        'flexiones_brazos',
        'press_banca',
        'sentadilla_libre',
        'dominadas',
        'pullover',
      ];

      for (final exerciseId in englishTestExercises) {
        final guide = await service.getExerciseGuide(
          exerciseId: exerciseId,
          language: 'en',
        );

        debugPrint(
          '$exerciseId → '
          '${guide?.name ?? 'NO NAME'} | '
          '${guide?.imageUrl != null ? 'IMAGE' : 'NO IMAGE'}',
        );
      }

      // final englishGuide = await service.getExerciseGuide(
      //   exerciseId: 'flexiones_brazos',
      //   language: 'en',
      // );

      // expect(englishGuide, isNotNull);
      // expect(englishGuide!.wgerId, 1551);
      // expect(englishGuide.name, isNotEmpty);
      // expect(englishGuide.description, isNotEmpty);

      // debugPrint('EN NAME: ${englishGuide.name}');
      // debugPrint('EN DESCRIPTION: ${englishGuide.description}');

      // final guide = await service.getExerciseGuide(
      //   exerciseId: 'flexiones_brazos',
      //   language: 'es',
      // );

      // expect(guide, isNotNull);
      // expect(guide!.wgerId, 1551);
      // expect(guide.name, isNotEmpty);
      // expect(guide.description, isNotEmpty);

      // debugPrint('WGER ID: ${guide.wgerId}');
      // debugPrint('NAME: ${guide.name}');
      // debugPrint('DESCRIPTION: ${guide.description}');
      // debugPrint('IMAGE: ${guide.imageUrl}');

      service.dispose();
    },
  );
}