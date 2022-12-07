import 'package:intl/intl.dart';

enum FormatType { DATE, TIME }

String dateFormater(
    {required DateTime dateTime, required FormatType formatType}) {
  switch (formatType) {
    case FormatType.DATE:
      return DateFormat("dd-MMM-yyyy").format(dateTime);
    case FormatType.TIME:
      return DateFormat("hh:mm").format(dateTime);
    default:
      return "invalid date";
  }
}
