import 'dart:convert' show json;

import 'package:flutter_test/flutter_test.dart' show expect, group, isA, test;
import 'package:streak_your_life/features/streak/data/models/streak_model.dart'
    show StreakModel;
import 'package:streak_your_life/features/streak/domain/entities/streak.dart'
    show RecurrenceType, Streak;

import '../../../../fixtures/fixture_reader.dart' show fixture;

void main() {
  final tStreakModel = StreakModel(
      name: "test streak",
      recurrence: RecurrenceType.daily,
      lastOccurrence: DateTime.parse("2024-11-25T09:07:32.770"));

  test(
    'should be a subclass of the Streak entity',
    () async {
      // assert
      expect(tStreakModel, isA<Streak>());
    },
  );

  group('fromJSON', () {
    test(
      'should return a valid model when the JSON is valid',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('streak.json'));
        // act
        final result = StreakModel.fromJSON(jsonMap);
        // assert
        expect(result, tStreakModel);
      },
    );

    test(
      'should return the correct JSON after back and forth conversion',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('streak.json'));
        // act
        final model = StreakModel.fromJSON(jsonMap);
        final result = model.toJSON();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
