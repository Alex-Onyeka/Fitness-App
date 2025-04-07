import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouttracker/data/workout_data.dart';
import 'package:workouttracker/pages/welcome_screen.dart';
import 'package:workouttracker/provider/progress_indicator_provider.dart';
import 'package:workouttracker/theme/main_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WorkoutData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgressIndicatorProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      theme: mainTheme,
    );
  }
}
