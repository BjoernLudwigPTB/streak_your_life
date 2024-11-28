import 'package:equatable/equatable.dart' show Equatable;

/// Enum representing the recurrence type of a streak.
///
/// Each enum value maps to a string representation used in JSON.
enum RecurrenceType {
  daily("1d"),
  weekly("1w"),
  monthly("1m"),
  yearly("1y");

  /// The string representation of the recurrence type.
  final String code;

  /// Private constructor for mapping string codes to enum values.
  const RecurrenceType(this.code);

  /// Converts a string code to the corresponding [RecurrenceType].
  ///
  /// Returns `null` if the code is invalid.
  static RecurrenceType? fromCode(String code) {
    for (final type in RecurrenceType.values) {
      if (type.code == code) {
        return type;
      }
    }
    return null; // Return null if no match is found
  }

  /// Returns the string code of the current [RecurrenceType].
  String toCode() => code;
}

/// A data class to store information about streaks.
///
/// This class holds the type of recurrence, the streak's name,
/// and optionally the date and time of the last occurrence.
class Streak extends Equatable {
  /// The name of the streak.
  final String name;

  /// The recurrence type of the streak.
  ///
  /// Defined using the [RecurrenceType] enum.
  final RecurrenceType recurrence;

  /// The date and time of the last occurrence of the streak.
  ///
  /// Can be `null` if the streak has not yet occurred.
  final DateTime? lastOccurrence;

  /// Create a new recurring streak.
  ///
  /// [name]: The name of the streak.
  /// [recurrence]: The type of recurrence.
  /// [lastOccurrence]: (Optional) The date and time of the last occurrence.
  const Streak({
    required this.name,
    required this.recurrence,
    this.lastOccurrence,
  });

  /// Return a string representation of the streak.
  ///
  /// Useful for debugging purposes.
  @override
  String toString() {
    return 'Streak(name: $name, recurrence: $recurrence, lastOccurrence: $lastOccurrence)';
  }

  /// List of properties used for equality comparison.
  @override
  List<Object?> get props => [name, recurrence, lastOccurrence];
}
