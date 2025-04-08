import 'dart:async';

import 'package:flutter/widgets.dart';

class ProgressIndicatorProvider extends ChangeNotifier {
  String number = "0";
  void increaseTimer(double startTime, double stopTime) {
    Timer.periodic(Duration(milliseconds: 80), (timer) {
      if (startTime > stopTime) {
        timer.cancel();
      } else {
        double firstNum = (10 / (stopTime * 10));
        (firstNum * startTime++).toString().length > 2
            ? number = (firstNum * startTime++)
                .toString()
                .substring(0, 4)
            : number = (firstNum * startTime++).toString();

        notifyListeners();
      }
    });
  }
}
