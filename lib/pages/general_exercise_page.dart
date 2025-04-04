import 'package:flutter/material.dart';
import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/components/main/exercise_container.dart';
import 'package:workouttracker/data/workout_data.dart';

class GeneralExercisePage extends StatefulWidget {
  const GeneralExercisePage({super.key});

  @override
  State<GeneralExercisePage> createState() =>
      _GeneralExercisePageState();
}

class _GeneralExercisePageState
    extends State<GeneralExercisePage> {
  //
  //
  //
  void showOptionsBottomSheet(
    BuildContext context,
    List<String> options,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.grey[900],
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children:
              options
                  .map(
                    (option) => ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // handle selection
                        setState(() {
                          exercise = option;
                        });
                        option == 'All'
                            ? setList()
                            : setListGeneric(option);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
        );
      },
    );
  }

  //
  //
  //
  //
  final WorkoutData _workoutData = WorkoutData();
  //
  //
  void setWorkOutNames() {
    for (
      var i = 0;
      i < _workoutData.workOutList.length;
      i++
    ) {
      workoutNames.add(_workoutData.workOutList[i].name);
    }
  }

  //
  List<String> workoutNames = [];
  //
  //
  //
  void setListGeneric(String name) {
    exercises
        .clear(); // Clear previous list to avoid duplicates

    for (var workout in _workoutData.workOutList) {
      if (workout.name == name) {
        // Only add exercises from matching workout
        for (var level in workout.level) {
          exercises.addAll(level.exercises);
        }
      }
    }
    exercises.sort((a, b) => a.name.compareTo(b.name));
  }

  void setList() {
    exercises.clear();
    for (var workout in _workoutData.workOutList) {
      for (var level in workout.level) {
        exercises.addAll(level.exercises);
      }
    }
    exercises.sort((a, b) => a.name.compareTo(b.name));
  }

  List<Exercise> exercises = [];
  String exercise = 'All';

  @override
  void initState() {
    super.initState();
    setList();
    setWorkOutNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
        foregroundColor: Colors.grey.shade300,
        title: Text(
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          'General Exercise',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              showOptionsBottomSheet(context, workoutNames);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 30,
            bottom: 30,
          ),
          child: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children:
                  exercises.map((exercise) {
                    return ExerciseContainer(
                      onTap: () {},
                      exercise: exercise,
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
