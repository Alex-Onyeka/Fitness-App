class Exercise {
  final String name;
  final int? count;
  final String description;
  final int? duration;
  final String? image;
  bool isCompleted;

  Exercise({
    required this.name,
    this.isCompleted = false,
    required this.description,
    this.image,
    this.count,
    this.duration,
  });
}

String convertSecondsToMinute(int seconds) {
  if (seconds < 60) {
    return seconds.toString();
  } else {
    return '${seconds ~/ 60}min, ${(seconds % 60).toString().length > 1 ? (seconds % 60).toString().substring(0, 2) : addZeroOnSingleInt((seconds % 60).toString()).toString()}secs.';
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
