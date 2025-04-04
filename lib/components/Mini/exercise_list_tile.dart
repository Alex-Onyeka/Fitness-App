import 'package:flutter/material.dart';
import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/classes/workout_class.dart';

class ExerciseListTile extends StatefulWidget {
  final Function()? onTap;
  final Exercise exercise;
  const ExerciseListTile({
    super.key,
    required this.exercise,
    required this.onTap,
  });

  @override
  State<ExerciseListTile> createState() =>
      _ExerciseListTileState();
}

class _ExerciseListTileState
    extends State<ExerciseListTile> {
  String toUpperCase(String text) {
    return text.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color.fromARGB(180, 0, 0, 0),
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
                  widget.exercise.isCompleted
                      ? Colors.grey.shade700
                      : const Color.fromARGB(
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
                  fontWeight: FontWeight.w500,
                  color:
                      widget.exercise.isCompleted
                          ? Colors.grey.shade600
                          : Colors.grey.shade300,
                ),
                toUpperCase(widget.exercise.name),
              ),
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color:
                        widget.exercise.isCompleted
                            ? Colors.grey.shade600
                            : Colors.grey.shade300,
                  ),
                  convertSecondsToDays(
                    widget.exercise.duration,
                  ),
                ),
              ],
            ),
            Icon(
              color:
                  widget.exercise.isCompleted
                      ? Colors.grey.shade700
                      : const Color.fromARGB(
                        200,
                        255,
                        193,
                        7,
                      ),
              size: 18,
              Icons.timer_sharp,
            ),

            Icon(
              color:
                  widget.exercise.isCompleted
                      ? Colors.grey.shade700
                      : Colors.grey.shade500,
              size: 20,
              widget.exercise.isCompleted
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
            ),
          ],
        ),
      ),
    );
  }
}
