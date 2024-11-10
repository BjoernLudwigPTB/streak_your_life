import 'package:equatable/equatable.dart';

/// Base class for representing failures, extending Equatable
abstract class Failure extends Equatable {
  /// List of properties used for equality comparison
  final List<Object?> properties;

  /// Constructor for the Failure class
  const Failure([this.properties = const <Object?>[]]);

  @override
  List<Object?> get props => properties;
}
