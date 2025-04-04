import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/components/main/workout_container.dart';
import 'package:workouttracker/data/workout_data.dart';
import 'package:workouttracker/pages/workout_details.dart';

class WorkoutListPage extends StatefulWidget {
  const WorkoutListPage({super.key});

  @override
  State<WorkoutListPage> createState() =>
      _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  //
  //
  //
  final WorkoutData _workoutData = WorkoutData();
  List<Workout> workouts = [];
  //
  //
  //
  void setList() {
    for (var element in _workoutData.workOutList) {
      if (element.name != 'All') {
        workouts.add(element);
      }
    }
  }
  //
  //
  //

  @override
  void initState() {
    super.initState();
    setList();
  }

  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      appBar: AppBar(
        foregroundColor: Colors.grey.shade300,
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
        centerTitle: true,
        title: Text(
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          'General Exercise',
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: WorkoutContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => WorkoutDetails(
                          workout: workouts[index],
                        ),
                  ),
                );
              },
              workout: workouts[index],
            ),
          );
        },
      ),
    );
  }
}
