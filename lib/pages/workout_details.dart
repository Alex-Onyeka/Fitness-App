import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';
import 'package:workouttracker/components/Mini/level_list_tile.dart';
import 'package:workouttracker/pages/exercise_list_page.dart';

class WorkoutDetails extends StatefulWidget {
  final Workout workout;
  const WorkoutDetails({super.key, required this.workout});

  @override
  State<WorkoutDetails> createState() =>
      _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
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
          'Workouts Details',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Transform.flip(
            flipX: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.workout.imagePath,
                  ),
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 0.5, 0.8, 1],
                begin: Alignment.topCenter,
                // Start point of the gradient
                end:
                    Alignment
                        .bottomCenter, // End point of the gradient
                colors: [
                  const Color.fromARGB(220, 0, 0, 0),
                  const Color.fromARGB(150, 0, 0, 0),
                  const Color.fromARGB(185, 0, 0, 0),
                  const Color.fromARGB(150, 0, 0, 0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45),
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.grey.shade200,
                    ),
                    '${widget.workout.name} Workout',
                  ),
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                    '( ${widget.workout.subtitle} )',
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Visibility(
                        visible:
                            widget
                                .workout
                                .description
                                .length >=
                            200,
                        child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                const Color.fromARGB(
                                  189,
                                  0,
                                  0,
                                  0,
                                ),
                                const Color.fromARGB(
                                  183,
                                  0,
                                  0,
                                  0,
                                ),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.9, 1],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(
                                          bottom: 2.0,
                                        ),
                                    child: Icon(
                                      color: Colors.grey,
                                      Icons
                                          .keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          children: [
                            Text(
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey.shade300,
                              ),
                              widget.workout.description,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          widget.workout.level.length,
                      itemBuilder: (context, index) {
                        WorkoutLevel level =
                            widget.workout.level[index];
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                          child: LevelListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (
                                        context,
                                      ) => ExerciseListPage(
                                        workoutLevel: level,
                                        workout:
                                            widget.workout,
                                      ),
                                ),
                              );
                            },
                            level: level,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
