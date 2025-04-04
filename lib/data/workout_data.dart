import 'package:flutter/material.dart';
import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/data/workout_list.dart';

class WorkoutData extends ChangeNotifier {
  //
  //
  List<Workout> workOutList = returnWorkOutList();
  //
  //

  String getTime() {
    DateTime main = DateTime.now();
    String year = main.year.toString().substring(2, 4);
    String day = main.day.toString();
    String hour = main.hour.toString();
    String second = main.second.toString();
    String finalTime = '$year-$day-$hour-$second';
    return finalTime;
  }

  String getNumberOfTotalWorkOuts() {
    return (workOutList.length + 1).toString();
  }

  // Add Work Out
  void addWorkOut(String name) {}

  //
  //
  // Add Excercise
  void addExercise(Workout workout, Exercise exercise) {}

  void toggleExercise(Exercise exercise) {
    exercise.isCompleted = !exercise.isCompleted;
    notifyListeners();
  }
}
