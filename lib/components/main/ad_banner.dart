import 'package:flutter/material.dart';

class AdBanner extends StatefulWidget {
  final Function()? onTap;
  const AdBanner({super.key, required this.onTap});

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  int currentImage = 0;
  List<int> banners = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/ad_banner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(120, 0, 0, 0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              20,
              60,
              30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      'Stronger Every Rap',
                    ),
                    Text(
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      'Every Step',
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
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Text(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
