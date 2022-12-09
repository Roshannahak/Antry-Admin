import 'package:intl/intl.dart';

enum FormatType { DATE, TIME }

String dateFormater(
    {required String dateTime, required FormatType formatType}) {
  if (dateTime.isNotEmpty) {
    DateTime _dateTime = DateTime.parse(dateTime);
    switch (formatType) {
      case FormatType.DATE:
        return DateFormat("dd-MMM-yyyy").format(_dateTime.toLocal());
      case FormatType.TIME:
        return DateFormat().add_Hm().format(_dateTime.toLocal());
      default:
        return "invalid date";
    }
  } else
    return "...";
}
