import 'package:intl/intl.dart';
import 'package:weather_app/resources/string_manager.dart';

class GetCityDate{
  String formatCityTime(int timezoneOffsetInSeconds) {
    // Current UTC time
    final utc = DateTime.now().toUtc();

    // Add the offset
    final cityTime = utc.add(Duration(seconds: timezoneOffsetInSeconds));

    // Example: "Monday 09:45 PM"
    return DateFormat(StringManager.dateFormat).format(cityTime);
  }
}