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
class Streak {
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
  Streak({
    required this.name,
    required this.recurrence,
    this.lastOccurrence,
  });

  /// Return a string representation of the event.
  ///
  /// Useful for debugging purposes.
  @override
  String toString() {
    return 'Streak(name: $name, recurrence: $recurrence, lastOccurrence: $lastOccurrence)';
  }

  /// Convert the streak into a Map object for storage (e.g., in JSON).
  ///
  /// Fields `name`, `recurrence`, and `lastOccurrence` are serialized.
  /// The enum value of [recurrence] is stored as its index.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'recurrence': recurrence.index,
      'lastOccurrence': lastOccurrence?.toIso8601String(),
    };
  }

  /// Create a [Streak] from a Map object.
  ///
  /// [map]: A Map object containing the keys `name`, `recurrence`, and `lastOccurrence`.
  /// Throws an error if required fields are missing or invalid.
  factory Streak.fromMap(Map<String, dynamic> map) {
    return Streak(
      name: map['name'],
      recurrence: RecurrenceType.values[map['recurrence']],
      lastOccurrence:
          map['lastOccurrence'] != null ? DateTime.parse(map['lastOccurrence']) : null,
    );
  }
}
