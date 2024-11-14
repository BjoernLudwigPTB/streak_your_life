import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:streak_your_life/core/error/failure.dart';
import 'package:streak_your_life/features/streak/data/repositories/local_storage.dart';
import 'package:streak_your_life/features/streak/domain/entities/streak.dart';
import 'package:streak_your_life/features/streak/domain/usecases/create_streak.dart';

class MockLocalStorageRepository extends Mock
    implements LocalStorageRepository<Streak> {
  @override
  Future<Either<Failure, int>> write(Streak streak) {
    return super.noSuchMethod(
      Invocation.method(#write, [streak]),
      returnValue: Future.value(Right<Failure, int>(1)),
      returnValueForMissingStub: Future.value(Right<Failure, int>(1)),
    );
  }
}

void main() {
  late CreateStreak createStreak;
  late MockLocalStorageRepository mockLocalStorageRepository;

  setUp(() {
    mockLocalStorageRepository = MockLocalStorageRepository();
    createStreak = CreateStreak(mockLocalStorageRepository);
  });

  final testStreak = Streak(name: 'testStreak', recurrence: RecurrenceType.daily);
  final randomInteger = Random().nextInt(1000);

  test('should store a given streak to the local storage', () async {
    // arrange
    when(mockLocalStorageRepository.write(testStreak))
        .thenAnswer((_) async => Right(randomInteger));

    // act
    final result = await createStreak.execute(streak: testStreak);
    // assert
    expect(result, Right(randomInteger));
    verify(mockLocalStorageRepository.write(testStreak)).called(1);
    verifyNoMoreInteractions(mockLocalStorageRepository);
  });
}
