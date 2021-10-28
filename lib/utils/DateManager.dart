import 'package:intl/intl.dart';

class DateManager{


  static String HandleVoitureDate(DateTime now)
  {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  static DateTime  HandleMissionDate(String date)
  {
    return DateFormat("yyyy-MM-dd").parse(date);
  }

}