import '../../domain/entities/streak.dart' show RecurrenceType, Streak;

/// A model class for handling streak data in the data layer.
///
/// The [StreakModel] class extends the [Streak] entity and provides
/// methods to convert between JSON and the internal [Streak] representation.
class StreakModel extends Streak {
  /// Creates a [StreakModel] instance with the given properties.
  ///
  /// [name]: The name of the streak.
  /// [recurrence]: The type of recurrence, represented by [RecurrenceType].
  /// [lastOccurrence]: (Optional) The date and time of the last occurrence.
  const StreakModel({
    required super.name,
    required super.recurrence,
    super.lastOccurrence,
  });

  /// Creates a [StreakModel] from a JSON object.
  ///
  /// [json]: A Map containing the fields `name`, `recurrence`, and `lastOccurrence`.
  /// - `name` is a [String].
  /// - `recurrence` is a [String] corresponding to a [RecurrenceType].
  /// - `lastOccurrence` is an ISO 8601 formatted [String] or `null`.
  ///
  /// Always returns a valid [StreakModel], using `RecurrenceType.daily` as
  /// the default if the `recurrence` code is invalid.
  factory StreakModel.fromJSON(Map<String, dynamic> json) {
    final recurrenceCode = json['recurrence'] as String;
    final recurrenceType =
        RecurrenceType.fromCode(recurrenceCode) ?? RecurrenceType.daily;

    final lastOccurrence = json['lastOccurrence'] != null
        ? DateTime.parse(json['lastOccurrence'] as String)
        : null;

    return StreakModel(
      name: json['name'] as String,
      recurrence: recurrenceType,
      lastOccurrence: lastOccurrence,
    );
  }

  /// Converts the [StreakModel] into a JSON-compatible Map.
  ///
  /// The resulting Map contains:
  /// - `name`: A [String] representing the name of the streak.
  /// - `recurrence`: A [String] representing the recurrence type.
  /// - `lastOccurrence`: An ISO 8601 formatted [String] or `null`.
  ///
  /// Returns a JSON-compatible Map.
  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'recurrence': recurrence.toCode(),
      'lastOccurrence': lastOccurrence?.toIso8601String(),
    };
  }
}
