import 'package:intl/intl.dart';

class Util {
  static String appId = "8cf8d13f96283f12ed70d8f0f6a14cec";

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}
