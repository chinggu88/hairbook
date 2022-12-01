import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/model/book_model.dart';
import 'package:table_calendar/table_calendar.dart';

class BookController extends GetxController {
  static BookController get to => Get.find<BookController>();

  ///현재 달력 포맷
  Rx<CalendarFormat> _calendarFormat = CalendarFormat.twoWeeks.obs;
  CalendarFormat get calendarFormat => _calendarFormat.value;
  set calendarFormat(CalendarFormat value) => _calendarFormat.value = value;

  ///선택한 날짜
  final Rx<DateTime> _selectDate = DateTime.now().obs;
  DateTime get selectDate => _selectDate.value;
  set selectDate(DateTime value) => _selectDate.value = value;

  Rx<DateTime> onclick = DateTime.now().obs;

  RxList<book> bookList = <book>[].obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlist();
  }

  ///예약건수 조회
  Future<void> readregitlist() async {
    log('[등록api][readregitlist] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    await getBookListbyDate(
        '/getBookListbyDate', {'date': dateTostr(DateTime.now())});
    log('[등록api][readregitlist] 등록성공');
  }
}
