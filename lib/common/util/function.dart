///2022121 > 20221201
String dateTostr(DateTime time) {
  String year = time.year.toString();
  String month = time.month.toString().length == 2
      ? time.month.toString()
      : '0' + time.month.toString();
  String day = time.day.toString().length == 2
      ? time.day.toString()
      : '0' + time.day.toString();
  return '${year}${month}${day}';
}

///String > YYYY-MM-DD
String strToDate(String time) {
  String year = time.substring(0, 4);
  String month = time.substring(4, 6);
  String day = time.substring(6, 8);
  return '${year}-${month}-${day}';
}

///String to datetime
DateTime strToDateTime(String time) {
  String year = time.substring(0, 4);
  String month = time.substring(4, 6);
  String day = time.substring(6, 8);
  return DateTime.parse('$year-$month-$day 00:00:00.000Z');
}

int diffDate(String date) {
  DateTime today = DateTime.now();
  DateTime start = DateTime.parse(date);
  return today.difference(start).inDays;
}
