import 'package:intl/intl.dart';

class DateManager{


  static String HandleMissionDate(DateTime now)
  {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

}