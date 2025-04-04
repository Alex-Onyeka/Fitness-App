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

String convertSecondsToDays(int seconds) {
  if (seconds < 60) {
    return '${seconds.toString()} secs';
  } else if (seconds >= 60 && seconds < 3600) {
    return '${seconds ~/ 60} mins';
  } else if (seconds >= 3600 && seconds < 86400) {
    return '${seconds ~/ 3600} hrs, ${convertSecondsToMinute(seconds % 3600)} mins';
  } else {
    return '${seconds ~/ 86400} day(s) ${newUse(seconds % 86400)}';
  }
}

String newUse(int seconds) {
  if (seconds >= 3600 && seconds < 86400) {
    return '${seconds ~/ 3600} hrs';
  } else {
    return '';
  }
}

String checkValue(int seconds) {
  if ((seconds % 86400) < 3600) {
    return '';
  } else {
    if ((seconds % 86400) < 1) {
      return '';
    } else if ((seconds % 86400).toString().length == 1 &&
        (seconds % 86400).toString().length == 2) {
      return ', ${(seconds % 86400).toString()}  hrs';
    } else {
      return ', ${(seconds % 86400).toString().substring(0, 2)} hrs';
    }
  }
}

// int roundOff(int number) {
//   if (number.toString().length <= 2) {
//     return 0;
//   } else if (number.toString().length > 2) {
//     return number.toString().substring(0, 2);
//   }
// }
