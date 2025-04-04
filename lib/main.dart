import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouttracker/data/workout_data.dart';
import 'package:workouttracker/pages/welcome_screen.dart';
import 'package:workouttracker/theme/main_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WorkoutData(),
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
