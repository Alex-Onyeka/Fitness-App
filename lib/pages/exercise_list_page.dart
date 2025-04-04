import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';
import 'package:workouttracker/components/Mini/exercise_list_tile.dart';

class ExerciseListPage extends StatefulWidget {
  final Workout workout;
  final WorkoutLevel workoutLevel;
  const ExerciseListPage({
    super.key,
    required this.workout,
    required this.workoutLevel,
  });

  @override
  State<ExerciseListPage> createState() =>
      _ExerciseListPageState();
}

class _ExerciseListPageState
    extends State<ExerciseListPage> {
  //
  //
  //
  //
  void startWorkOut(WorkoutLevel level) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countDownTimer < 1) {
        timer.cancel();
        // loadNextExercise(level);
        finishExercise(level, currentIndex);
        setState(() {
          currentIndex++;
          countDownTimer =
              level.exercises[currentIndex].duration;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Finished Succeffully')),
        );
      } else {
        setState(() {
          countDownTimer--;
        });
      }
    });
  }

  //
  //

  void finishExercise(WorkoutLevel level, int index) {
    level.exercises[index].isCompleted = true;
  }
  //
  //
  // void loadNextExercise(WorkoutLevel level) {
  //   setState(() {
  //     currentIndex += 1;
  //     countDownTimer =
  //         level.exercises[currentIndex - 1].duration;
  //   });
  // }

  //
  //
  //
  int countDownTimer = 0;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      countDownTimer =
          widget.workoutLevel.exercises[0].duration;
    });
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
          'Exercise Page',
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
                    '${widget.workoutLevel.exercises[currentIndex].name} Workout',
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

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                73,
                                0,
                                0,
                                0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(
                                    100,
                                  ),
                            ),
                            height: 200,
                            width: 200,
                            child: Icon(
                              size: 150,
                              color: const Color.fromARGB(
                                45,
                                255,
                                193,
                                7,
                              ),
                              Icons.timer_outlined,
                            ),
                          ),
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            countDownTimer.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          startWorkOut(widget.workoutLevel);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              'Start Now!',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        'Coming Next...',
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          widget
                              .workoutLevel
                              .exercises
                              .length,
                      itemBuilder: (context, index) {
                        WorkoutLevel level =
                            widget.workoutLevel;
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                          child: ExerciseListTile(
                            onTap: () {
                              // loadNextExercise(level);
                            },
                            exercise:
                                level.exercises[index],
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
