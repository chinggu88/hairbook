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
