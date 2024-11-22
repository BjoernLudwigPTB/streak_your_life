import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:streak_your_life/core/usecases/usecase.dart';

import '../../../../core/error/failure.dart' show Failure;
import '../../data/repositories/local_storage.dart';
import '../entities/streak.dart';

/// A use case for creating a new streak and storing it in the local storage.
///
/// This class is part of the Clean Architecture pattern and defines
/// the use case for persisting a `Streak` entity into a repository.
///
/// Implements [UseCase] to ensure it follows the contract for all use cases.
class CreateStreak implements UseCase<int, Params> {
  /// The repository responsible for managing local storage.
  final LocalStorageRepository localStorageRepository;

  /// Creates a [CreateStreak] use case with the given [LocalStorageRepository].
  CreateStreak(this.localStorageRepository);

  /// Executes the use case by writing the provided streak to local storage.
  ///
  /// Takes [Params] containing the streak to be saved and returns a
  /// [Future] containing an [Either] that wraps a [Failure] or the
  /// identifier of the newly created streak (an [int]).
  ///
  /// Example:
  /// ```dart
  /// final result = await createStreak(Params(streak: myStreak));
  /// result.fold(
  ///   (failure) => print('Error: $failure'),
  ///   (id) => print('Streak created with ID: $id'),
  /// );
  /// ```
  @override
  Future<Either<Failure, int>> call(Params params) async {
    return await localStorageRepository.write(params.streak);
  }
}

/// Parameters required for the [CreateStreak] use case.
///
/// This class encapsulates the data needed to execute the use case,
/// ensuring a clean and reusable interface. Implements [Equatable]
/// to support value equality for testing and comparisons.
class Params extends Equatable {
  /// The [Streak] entity to be created and stored.
  final Streak streak;

  /// Creates a [Params] instance with the required [streak].
  ///
  /// The `streak` parameter must not be null.
  const Params({required this.streak});

  /// A list of properties to compare for equality.
  ///
  /// This ensures that instances of [Params] are compared
  /// based on their [streak] value, rather than reference.
  @override
  List<Object?> get props => [streak];
}
