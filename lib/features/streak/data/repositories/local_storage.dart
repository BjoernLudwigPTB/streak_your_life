import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:streak_your_life/core/error/failure.dart';

/// Abstract class for managing data storage using Isar.
///
/// This class defines common CRUD operations to be implemented
/// by subclasses.
abstract class LocalStorageRepository<T> {
  /// The Isar collection for the data type T.
  late final IsarCollection<T> collection;

  /// Opens the Isar instance and initializes the collection.
  ///
  /// This method must be called before performing any operations.
  Future<void> initialize(Isar isar) async {
    collection = isar.collection<T>();
  }

  /// Reads an object by its ID from the Isar collection.
  Future<Either<Failure, T>> read(int id);

  /// Writes a new object to the Isar collection.
  Future<void> write(T object);

  /// Updates an object in the Isar collection.
  Future<void> update(int id, T updatedObject);

  /// Deletes an object by its ID from the Isar collection.
  Future<void> delete(int id);

  /// Reads all objects from the Isar collection.
  Future<List<T>> readAll();
}
