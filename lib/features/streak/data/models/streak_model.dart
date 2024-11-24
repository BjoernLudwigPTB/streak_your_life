import '../../domain/entities/streak.dart';

/// A data model class for streaks that extends the [Streak] entity.
///
/// The [StreakModel] class represents the implementation of a streak
/// in the data layer.
class StreakModel extends Streak {
  /// Creates a [StreakModel] instance with the specified properties.
  ///
  /// - [name]: The name of the streak (e.g., "Daily Exercise").
  /// - [recurrence]: Specifies the recurrence pattern of the streak
  ///   (e.g., daily, weekly).
  /// - [lastOccurrence]: Optionally specifies the last occurrence date
  ///   of the streak. If not provided, it defaults to `null`.
  StreakModel({
    required super.name,
    required super.recurrence,
    super.lastOccurrence,
  });
}
