import 'package:workouttracker/classes/exercise_class.dart';
import 'package:workouttracker/classes/workout_class.dart';
import 'package:workouttracker/classes/workout_level_class.dart';
import 'package:workouttracker/constants/exercises.dart';

List<Workout> returnWorkOutList() {
  return workOutList;
}

List<Workout> workOutList = [
  Workout(
    imagePath: 'assets/splash/splash_screen.jpg',
    name: 'All',
    subtitle: 'subtitle',
    id: 0,
    description:
        'Storing Image instances inside the class prevents serialization (e.g., for JSON',
    level: [],
  ),
  Workout(
    imagePath: 'assets/splash/splash_screen2.jpg',
    name: arm,
    subtitle: 'You can flip a widget',
    id: 1,
    description:
        'which might not be the best approach for requiring images in Flutter.',
    level: [
      WorkoutLevel(
        level: beginnerLevel,
        exercises: [
          Exercise(
            name: 'Running',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 10,
            image: 'assets/splash/splash_screen.jpg',
          ),
          Exercise(
            name: 'Jumping',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 15,
            image: 'assets/splash/splash_screen2.jpg',
          ),
        ],
      ),
      WorkoutLevel(
        level: intermediateLevel,
        exercises: [
          Exercise(
            name: 'Running',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 10,
            image: 'assets/splash/splash_screen4.jpg',
          ),
          Exercise(
            name: 'Jumping',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 20,
            image: 'assets/splash/splash_screen.jpg',
          ),
        ],
      ),
      WorkoutLevel(
        level: advancedLevel,
        exercises: [
          Exercise(
            name: 'Running',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 10,
            image: 'assets/splash/splash_screen2.jpg',
          ),
          Exercise(
            name: 'Jumping',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 25,
            image: 'assets/splash/splash_screen3.jpg',
          ),
        ],
      ),
    ],
  ),
  Workout(
    imagePath: 'assets/splash/splash_screen3.jpg',
    name: byceps,
    subtitle: 'You can flip a widget',
    id: 2,
    description:
        'In your UI, you can load the image using Image.asset() or Image.network()',
    level: [
      WorkoutLevel(
        level: beginnerLevel,
        exercises: [
          Exercise(
            name: 'Sit Up',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 10,
            image: 'assets/splash/splash_screen4.jpg',
          ),
          Exercise(
            name: 'Plank',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            duration: 15,
            image: 'assets/splash/splash_screen2.jpg',
          ),
        ],
      ),
      WorkoutLevel(
        level: intermediateLevel,
        exercises: [
          Exercise(
            name: 'Sit Up',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 15,
            image: 'assets/splash/splash_screen.jpg',
          ),
          Exercise(
            name: 'Plank',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            duration: 25,
            image: 'assets/splash/splash_screen3.jpg',
          ),
        ],
      ),
      WorkoutLevel(
        level: advancedLevel,
        exercises: [
          Exercise(
            name: 'Sit Up',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            count: 20,
            image: 'assets/splash/splash_screen2.jpg',
          ),
          Exercise(
            name: 'Plank',
            description:
                'In your UI, you can load the image using Image.asset() or Image.network()',
            duration: 30,
            image: 'assets/splash/splash_screen4.jpg',
          ),
        ],
      ),
    ],
  ),
];
