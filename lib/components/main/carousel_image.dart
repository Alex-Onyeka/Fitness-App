import 'dart:async';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({super.key});

  @override
  State<CarouselImage> createState() =>
      _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int _currentIndex = 0;
  final List<String> images = [
    'assets/splash/splash_screen.jpg',
    'assets/splash/splash_screen2.jpg',
    'assets/splash/splash_screen3.jpg',
    'assets/splash/splash_screen4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex =
              (_currentIndex + 1) % images.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: Image.asset(
                images[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
