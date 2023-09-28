import 'package:intl/intl.dart';

class FormatDate {
  FormatDate({required this.currentTime});
  final int currentTime;

  String getFormatted(String format) {
    final dt = DateTime.fromMillisecondsSinceEpoch(currentTime);
    return DateFormat(format).format(dt);
  }
}
