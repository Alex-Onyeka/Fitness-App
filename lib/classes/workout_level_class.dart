import 'package:workouttracker/classes/exercise_class.dart';

class WorkoutLevel {
  final String level;
  final List<Exercise> exercises;

  WorkoutLevel({
    required this.level,
    required this.exercises,
  });
}
