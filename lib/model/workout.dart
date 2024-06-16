import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_strength_log_flutter/rpe.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required String description,
    required DateTime date,
    required int reps,
    required int sets,
    required Rpe rpe,
  }) = _Workout;
}
