import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light, // Explicitly set brightness
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.amberAccent,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.grey.shade100,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 25,
      color: Colors.grey.shade300,
    ),
  ),
);
