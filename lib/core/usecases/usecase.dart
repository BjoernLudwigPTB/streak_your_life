import 'package:dartz/dartz.dart';
import 'package:streak_your_life/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
