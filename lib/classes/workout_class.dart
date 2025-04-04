import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';

class Workout {
  final String name;
  final String subtitle;
  final String imagePath;
  final String description;
  final int id;
  final List<WorkoutLevel> level;

  Workout({
    required this.name,
    required this.subtitle,
    required this.id,
    required this.description,
    required this.level,
    required this.imagePath,
  });
}

const String beginnerLevel = 'Beginner';
const String intermediateLevel = 'Intermediate';
const String advancedLevel = 'Advanced';

String convertSecondsToHours(int seconds) {
  if (seconds < 60) {
    return seconds.toString();
  } else if (seconds == 60 && seconds < 3600) {
    return '${seconds ~/ 60}:${(seconds % 60).toString().substring(0, 2)}';
  } else {
    return '${seconds ~/ 3600}hrs, ${convertSecondsToMinute(seconds % 3600)}';
  }
}
