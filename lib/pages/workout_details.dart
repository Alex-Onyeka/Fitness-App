import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';

class WorkoutDetails extends StatefulWidget {
  final Workout workout;
  const WorkoutDetails({super.key, required this.workout});

  @override
  State<WorkoutDetails> createState() =>
      _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  String toUpperCase(String text) {
    return text.toUpperCase();
  }

  int getTotalTime(WorkoutLevel level) {
    int total = 0;
    for (var exercise in level.exercises) {
      total =
          total +
          int.parse(
            (exercise.duration ?? 0 as num).toString(),
          );
    }
    return total;
  }

  int getTotalLaps(WorkoutLevel level) {
    int total = 0;
    for (var exercise in level.exercises) {
      total =
          total +
          int.parse(
            (exercise.count ?? 0 as num).toString(),
          );
    }
    return total;
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
                  SizedBox(height: 60),
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
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey.shade300,
                    ),
                    widget.workout.description,
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
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(
                                      10,
                                    ),
                                color: const Color.fromARGB(
                                  150,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Row(
                                spacing: 15,
                                children: [
                                  Icon(
                                    color:
                                        const Color.fromARGB(
                                          200,
                                          255,
                                          193,
                                          7,
                                        ),
                                    Icons.menu_open,
                                  ),
                                  Expanded(
                                    child: Text(
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.w500,
                                        color:
                                            Colors
                                                .grey
                                                .shade300,
                                      ),
                                      toUpperCase(
                                        level.level,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Column(
                                        children: [
                                          Visibility(
                                            visible:
                                                convertSecondsToHours(
                                                  getTotalTime(
                                                    level,
                                                  ),
                                                ) !=
                                                '0',
                                            child: Text(
                                              style: TextStyle(
                                                fontWeight:
                                                    FontWeight
                                                        .w500,
                                                color:
                                                    Colors
                                                        .grey
                                                        .shade300,
                                              ),
                                              '${convertSecondsToHours(getTotalTime(level))} Mins',
                                            ),
                                          ),
                                          Text(
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeight
                                                      .w500,
                                              color:
                                                  Colors
                                                      .grey
                                                      .shade300,
                                            ),
                                            '${getTotalLaps(level)} Laps',
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        color:
                                            const Color.fromARGB(
                                              200,
                                              255,
                                              193,
                                              7,
                                            ),
                                        size: 18,
                                        Icons.timer_sharp,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    color:
                                        Colors
                                            .grey
                                            .shade500,
                                    size: 20,
                                    Icons
                                        .arrow_forward_ios_rounded,
                                  ),
                                ],
                              ),
                            ),
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
