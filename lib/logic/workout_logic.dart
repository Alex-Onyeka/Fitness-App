import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';

class WorkoutLogic extends ChangeNotifier {
  int setTime(WorkoutLevel level) {
    if (level.level == beginnerLevel) {
      return level.exercises[0].duration;
    } else if (level.level == intermediateLevel) {
      return level.exercises[1].duration;
    } else if (level.level == advancedLevel) {
      return level.exercises[2].duration;
    }
    return 0;
  }

  void startWorkout(WorkoutLevel level) {}
}
