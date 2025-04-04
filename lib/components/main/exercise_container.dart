import 'package:flutter/material.dart';
import 'package:workouttracker/classes/exercise_class.dart';

class ExerciseContainer extends StatefulWidget {
  final Function()? onTap;
  final Exercise exercise;
  const ExerciseContainer({
    super.key,
    required this.exercise,
    required this.onTap,
  });

  @override
  State<ExerciseContainer> createState() =>
      _ExerciseContainerState();
}

class _ExerciseContainerState
    extends State<ExerciseContainer> {
  String cutLongText(String text) {
    if (text.length >= 40) {
      return '${text.substring(0, 40)}...';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            height: 240,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(widget.exercise.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 20,
              top: 10,
            ),
            height: 240,
            width: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 0.5, 0.8, 1],
                begin: Alignment.topCenter,
                // Start point of the gradient
                end:
                    Alignment
                        .bottomCenter, // End point of the gradient
                colors: [
                  const Color.fromARGB(36, 0, 0, 0),
                  const Color.fromARGB(64, 0, 0, 0),
                  const Color.fromARGB(185, 0, 0, 0),
                  const Color.fromARGB(150, 0, 0, 0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                        color: const Color.fromARGB(
                          124,
                          0,
                          0,
                          0,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              widget.exercise.count == null
                                  ? '${widget.exercise.duration} Mins'
                                  : '${widget.exercise.count} Laps',
                            ),
                            Icon(
                              color: Colors.white,
                              size: 16,
                              widget.exercise.count == null
                                  ? Icons.timer_outlined
                                  : Icons
                                      .airline_seat_recline_extra_rounded,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        widget.exercise.name,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cutLongText(
                                widget.exercise.description,
                              ),
                            ),
                          ),
                          Icon(
                            color: Colors.grey.shade400,
                            size: 20,
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
