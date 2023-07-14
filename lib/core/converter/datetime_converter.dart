import 'package:intl/intl.dart';

import '../constants/error_message.dart';

class DateTimeConverter {
  static String getDate(double? epochTime) {
    if (epochTime != null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
        epochTime.toInt(),
      );
      final date = DateFormat.yMMMMd('en_US').format(dateTime); // July 14, 2023
      return date;
    } else {
      return ErrorMessage.isNotDetermined;
    }
  }
}
