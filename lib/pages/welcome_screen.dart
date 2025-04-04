import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workouttracker/components/main/carousel_image.dart';
import 'package:workouttracker/pages/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() =>
      _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String transformToUppercase(String text) {
    return text.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselImage(),
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
                  const Color.fromARGB(200, 0, 0, 0),
                  const Color.fromARGB(64, 0, 0, 0),
                  const Color.fromARGB(179, 0, 0, 0),
                  const Color.fromARGB(185, 0, 0, 0),
                ],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 50,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(height: 60),
                    SvgPicture.asset(
                      'assets/logo/logo.svg',
                      width: 100,
                      height: 100,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.grey.shade200,
                          ),
                          transformToUppercase(
                            "Let's Go Harder!",
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                          ),

                          "Welcome to Your Ultimate Fitness Companion. Track Your Progress, Stay Motivated, and Achieve Your Goals One Workout at a Time!",
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => HomePage(),
                              ),
                              (route) {
                                return false;
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                                transformToUppercase(
                                  'Let\'s Go!',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
