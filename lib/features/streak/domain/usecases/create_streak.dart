import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart' show Failure;
import '../../data/repositories/local_storage.dart';
import '../entities/streak.dart';

class CreateStreak {
  final LocalStorageRepository localStorageRepository;

  CreateStreak(this.localStorageRepository);

  Future<Either<Failure, int>> execute({required Streak streak}) async {

    return await localStorageRepository.write(streak);
  }
}
