import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';

class WorkoutContainer extends StatefulWidget {
  final Workout workout;
  final Function()? onTap;
  const WorkoutContainer({
    super.key,
    required this.onTap,
    required this.workout,
  });

  @override
  State<WorkoutContainer> createState() =>
      _WorkoutContainerState();
}

class _WorkoutContainerState
    extends State<WorkoutContainer> {
  String cutLongText(String text) {
    if (text.length >= 70) {
      return '${text.substring(0, 70)}...';
    } else {
      return text;
    }
  }

  int currentImage = 0;
  List<int> banners = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(widget.workout.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: const Color.fromARGB(120, 0, 0, 0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0, 0.3, 0.6, 1],
              colors: [
                const Color.fromARGB(154, 0, 0, 0),
                const Color.fromARGB(160, 0, 0, 0),
                const Color.fromARGB(87, 0, 0, 0),
                const Color.fromARGB(52, 0, 0, 0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              15,
              80,
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 5,
                                color: const Color.fromARGB(
                                  184,
                                  0,
                                  0,
                                  0,
                                ),
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          widget.workout.name,
                        ),
                        Text(
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                offset: Offset(0, 0),
                                color: const Color.fromARGB(
                                  250,
                                  0,
                                  0,
                                  0,
                                ),
                              ),
                            ],
                          ),
                          '(${widget.workout.subtitle})',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            color: const Color.fromARGB(
                              250,
                              0,
                              0,
                              0,
                            ),
                          ),
                        ],
                      ),
                      cutLongText(
                        widget.workout.description,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: widget.onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        65,
                        0,
                        0,
                        0,
                      ),
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Text(
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      'Start Workout',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
