import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:streak_your_life/core/error/failure.dart' show Failure;
import 'package:streak_your_life/core/usecases/usecase.dart' show NoParams;
import 'package:streak_your_life/features/streak/data/repositories/local_storage.dart'
    show LocalStorageRepository;
import 'package:streak_your_life/features/streak/domain/entities/streak.dart'
    show RecurrenceType, Streak;
import 'package:streak_your_life/features/streak/domain/usecases/show_streaks.dart'
    show ShowStreaks;

final testResult = Right<Failure, List<Streak>>(
    [Streak(name: 'testStreak', recurrence: RecurrenceType.daily)]);

class MockLocalStorageRepository extends Mock
    implements LocalStorageRepository<Streak> {
  @override
  Future<Either<Failure, List<Streak>>> readAll() {
    return super.noSuchMethod(
      Invocation.method(#readAll, []),
      returnValue: Future.value(testResult),
      returnValueForMissingStub: Future.value(testResult),
    );
  }
}

void main() {
  late ShowStreaks showStreaks;
  late MockLocalStorageRepository mockLocalStorageRepository;

  setUp(() {
    mockLocalStorageRepository = MockLocalStorageRepository();
    showStreaks = ShowStreaks(mockLocalStorageRepository);
  });

  test('should show streaks in the local storage repository', () async {
    // arrange
    when(mockLocalStorageRepository.readAll()).thenAnswer((_) async => testResult);

    // act
    final result = await showStreaks(NoParams());
    // assert
    expect(result, testResult);
    verify(mockLocalStorageRepository.readAll()).called(1);
    verifyNoMoreInteractions(mockLocalStorageRepository);
  });
}
