import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workouttracker/classes/exercise_class.dart';

class SingleExercisePage extends StatefulWidget {
  final Exercise exercise;
  const SingleExercisePage({
    super.key,
    required this.exercise,
  });

  @override
  State<SingleExercisePage> createState() =>
      _SingleExercisePageState();
}

class _SingleExercisePageState
    extends State<SingleExercisePage> {
  //
  //
  //
  //
  void startWorkOut(Exercise exercise) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countDownTimer < 1) {
        timer.cancel();
        // loadNextExercise(level);
        finishExercise(exercise);
        setState(() {
          countDownTimer = 0;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Finished Succeffully')),
        );
      } else {
        setState(() {
          countDownTimer--;
          numbers = convertSecondsToMinuteList(
            countDownTimer,
          );
        });
        print(numbers);
      }
    });
  }

  //
  //

  void finishExercise(Exercise exercise) {
    exercise.isCompleted = true;
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
  List numbers = [];
  void setList() {
    numbers.addAll(
      convertSecondsToMinuteList(widget.exercise.duration),
    );
  }

  //
  //
  //
  int countDownTimer = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      countDownTimer = widget.exercise.duration;
    });
    setList();
    print(numbers);
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
                  image: AssetImage(widget.exercise.image!),
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
                    '${widget.exercise.name} Workout',
                  ),
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                    '( ${widget.exercise.description} )',
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
                          numbers.length > 1
                              ? Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: [
                                  Text(
                                    style: TextStyle(
                                      color:
                                          Colors
                                              .grey
                                              .shade300,
                                      fontSize: 80,
                                      fontWeight:
                                          FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color:
                                              Colors.black,
                                          offset: Offset(
                                            0,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    numbers[0],
                                  ),
                                  Text(
                                    style: TextStyle(
                                      color:
                                          Colors
                                              .grey
                                              .shade300,
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color:
                                              Colors.black,
                                          offset: Offset(
                                            0,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    numbers[1],
                                  ),
                                ],
                              )
                              : Text(
                                style: TextStyle(
                                  color:
                                      Colors.grey.shade300,
                                  fontSize: 80,
                                  fontWeight:
                                      FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                numbers[0],
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
                          widget.exercise.isCompleted
                              ? Navigator.of(context).pop()
                              : startWorkOut(
                                widget.exercise,
                              );
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
                              widget.exercise.isCompleted
                                  ? 'Finish Now'
                                  : 'Start Now!',
                            ),
                          ),
                        ),
                      ),
                    ],
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
