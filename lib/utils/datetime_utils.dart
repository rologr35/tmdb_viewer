
import 'package:intl/intl.dart';

class DateTimeUtils {

  static String showInFormat(String dateFormat, DateTime? datetime,
      {String defValue = ""}) {
    try {
      if (datetime == null) {
        return defValue;
      }
      DateFormat formatter = DateFormat(dateFormat);
      return formatter.format(datetime);
    } catch (ex) {
      return defValue;
    }
  }

}
