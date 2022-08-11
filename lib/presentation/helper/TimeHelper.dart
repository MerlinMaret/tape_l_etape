class TimeHelper {

  static String secondsToMinutesString(int seconds) {
    int minute = (seconds / 60).floor();
    String minuteString;
    if (minute < 10) {
      minuteString = "0$minute";
    } else {
      minuteString = "$minute";
    }
    int secondLeft = seconds % 60;
    String secondLeftString;
    if (secondLeft < 10) {
      secondLeftString = "0$secondLeft";
    } else {
      secondLeftString = "$secondLeft";
    }
    return "$minuteString:$secondLeftString";
  }
}