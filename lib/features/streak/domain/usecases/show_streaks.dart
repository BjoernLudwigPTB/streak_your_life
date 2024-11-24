import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart' show Failure;
import '../../../../core/usecases/usecase.dart' show NoParams, UseCase;
import '../../data/repositories/local_storage.dart' show LocalStorageRepository;
import '../entities/streak.dart' show Streak;

/// A use case for retrieving all stored streaks.
///
/// This class defines the logic to fetch a list of [Streak] entities from the local
/// storage.
///
/// Implements [UseCase] to conform to the use case interface.
class ShowStreaks implements UseCase<List<Streak>, NoParams> {
  /// The repository responsible for accessing and managing streak entities.
  final LocalStorageRepository<Streak> repository;

  /// Creates a [ShowStreaks] use case with the given [LocalStorageRepository].
  ShowStreaks(this.repository);

  /// Executes the use case to retrieve all streaks from the repository.
  ///
  /// Since no parameters are required for this use case, it takes an
  /// instance of [NoParams]. Returns a [Future] containing an [Either]
  /// that wraps a [Failure] (in case of an error) or a list of [Streak] entities.
  ///
  /// Example:
  /// ```dart
  /// final result = await showStreaks(NoParams());
  /// result.fold(
  ///   (failure) => print('Error: $failure'),
  ///   (streaks) => print('Retrieved ${streaks.length} streaks'),
  /// );
  /// ```
  @override
  Future<Either<Failure, List<Streak>>> call(NoParams noParams) async {
    return repository.readAll();
  }
}
