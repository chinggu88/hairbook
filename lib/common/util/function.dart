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
  return start.difference(today).inDays;
}

///String > YYYY년 MM월 DD일
String strToKorDate(String time) {
  String year = time.substring(0, 4);
  String month = time.substring(4, 6);
  String day = time.substring(6, 8);
  return '${year}년 ${month}월 ${day}일';
}



/// get the today use datetime
DateTime getToday() {
  DateTime today = DateTime.now();
  return DateTime(today.year, today.month, today.day);
}

///a날짜와 b날짜 사이에 c가 포함되는지 확인
bool isBetween(DateTime a, DateTime b, DateTime c) {
  return a.isBefore(c) && b.isAfter(c);
}
