import 'package:flutter/material.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';

class LevelListTile extends StatefulWidget {
  final Function()? onTap;
  final WorkoutLevel level;
  const LevelListTile({
    super.key,
    required this.level,
    required this.onTap,
  });

  @override
  State<LevelListTile> createState() =>
      _LevelListTileState();
}

class _LevelListTileState extends State<LevelListTile> {
  String toUpperCase(String text) {
    return text.toUpperCase();
  }

  int getTotalTime(WorkoutLevel level) {
    int total = 0;
    for (var exercise in level.exercises) {
      total =
          total + int.parse((exercise.duration).toString());
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(150, 0, 0, 0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          spacing: 15,
          children: [
            Icon(
              color: const Color.fromARGB(200, 255, 193, 7),
              Icons.menu_open,
            ),
            Expanded(
              child: Text(
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade300,
                ),
                toUpperCase(widget.level.level),
              ),
            ),
            Row(
              spacing: 5,
              children: [
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade300,
                      ),
                      convertSecondsToDays(
                        getTotalTime(widget.level),
                      ),
                    ),
                  ],
                ),
                Icon(
                  color: const Color.fromARGB(
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
              color: Colors.grey.shade500,
              size: 20,
              Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
