import 'package:flutter_test/flutter_test.dart';
import 'package:streak_your_life/features/streak/data/models/streak_model.dart';
import 'package:streak_your_life/features/streak/domain/entities/streak.dart';

void main() {
  final tStreakModel =
      StreakModel(name: "test streak", recurrence: RecurrenceType.daily);

  test(
    'should be a subclass of the Streak entity',
    () async {
      // assert
      expect(tStreakModel, isA<Streak>());
    },
  );
}
