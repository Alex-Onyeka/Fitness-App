import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/components/main/ad_banner.dart';
import 'package:workouttracker/components/main/exercise_container.dart';
import 'package:workouttracker/data/workout_data.dart';
import 'package:workouttracker/pages/general_exercise_page.dart';
import 'package:workouttracker/pages/workout_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  //
  final WorkoutData _workoutData = WorkoutData();
  //
  //
  void setList() {
    exercises.clear();
    for (var workout in _workoutData.workOutList) {
      for (var level in workout.level) {
        exercises.addAll(level.exercises);
      }
    }
    exercises.sort((a, b) => a.name.compareTo(b.name));
  }

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

  //
  List<Exercise> exercises = [];
  int currentIndex = 0;
  String exercise = 'All';

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      appBar: AppBar(
        foregroundColor: Colors.grey.shade300,
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
        title: Text(
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          'Workouts Page',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          children: [
            // Row(children: [Text('Alex Onyeka')]),
            SizedBox(height: 20),
            //
            //
            AdBanner(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutListPage(),
                  ),
                );
              },
            ),
            //
            //
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  'Daily Workout',
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                GeneralExercisePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5,
                    ),
                    child: Row(
                      spacing: 5,
                      children: [
                        Text(
                          style: TextStyle(
                            color: const Color.fromARGB(
                              200,
                              255,
                              193,
                              7,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          'See All',
                        ),
                        Icon(
                          color: const Color.fromARGB(
                            200,
                            255,
                            193,
                            7,
                          ),
                          size: 16,
                          Icons.arrow_forward_ios_sharp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    //  list.length,
                    Provider.of<WorkoutData>(
                      context,
                    ).workOutList.length,
                itemBuilder: (context, index) {
                  String category =
                      Provider.of<WorkoutData>(
                        context,
                      ).workOutList[index].name;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          exercise =
                              Provider.of<WorkoutData>(
                                context,
                                listen: false,
                              ).workOutList[index].name;
                        });
                        if (Provider.of<WorkoutData>(
                              context,
                              listen: false,
                            ).workOutList[index].name !=
                            'All') {
                          setListGeneric(exercise);
                        } else {
                          setList();
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 80,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == index
                                  ? Colors.amberAccent
                                  : Colors.grey.shade900,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            style: TextStyle(
                              color:
                                  currentIndex == index
                                      ? Colors.black
                                      : Colors
                                          .grey
                                          .shade300,
                              fontSize:
                                  currentIndex == index
                                      ? 15
                                      : 14,
                              fontWeight:
                                  currentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                            category,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 240,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  Exercise currentExercise =
                      exercises[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: ExerciseContainer(
                      onTap: () {},
                      exercise: currentExercise,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
