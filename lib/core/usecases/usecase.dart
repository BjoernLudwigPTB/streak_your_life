import 'package:dartz/dartz.dart';
import 'package:streak_your_life/core/error/failure.dart';

import '../error/failure.dart';

/// A base class for all use cases in the application.
///
/// This abstract class defines a contract for use cases, ensuring that they
/// follow a consistent structure. A use case represents a single unit of
/// business logic and adheres to the principles of Clean Architecture.
///
/// Each use case:
/// - Accepts a set of [Params] as input.
/// - Returns a [Future] of an [Either], containing either a [Failure] or
///   a result of type [Type].
abstract class UseCase<Type, Params> {
  /// Executes the use case with the given [params].
  ///
  /// The [params] object contains all the necessary input for the use case.
  /// Returns a [Future] containing an [Either] with a [Failure] in case
  /// of an error or a value of type [Type] upon success.
  Future<Either<Failure, Type>> call(Params params);
}
