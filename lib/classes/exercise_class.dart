class Exercise {
  final String name;
  // final int? count;
  final String description;
  final int duration;
  final String? image;
  bool isCompleted;

  Exercise({
    required this.name,
    this.isCompleted = false,
    required this.description,
    this.image,
    // this.count,
    required this.duration,
  });
}

String convertSecondsToMinute(int seconds) {
  if (seconds < 60) {
    return seconds.toString();
  } else {
    return '${seconds ~/ 60}';
  }
}

List convertSecondsToMinuteList(int seconds) {
  if (seconds < 60) {
    return [seconds.toString()];
  } else {
    return ['${seconds ~/ 60}', '${seconds % 60}'];
  }
}

int convertMinutesToSeconds(int minutes) {
  return minutes * 60;
}

String addZeroOnSingleInt(String number) {
  if (number.length < 2) {
    return '0$number';
  } else {
    return number;
  }
}
