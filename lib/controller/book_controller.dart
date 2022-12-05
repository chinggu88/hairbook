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
  final Rx<DateTime> selectDate = DateTime.now().obs;

  Rx<DateTime> onclick = DateTime.now().obs;

  ///달력이벤트 목록
  RxMap<DateTime, List<Map<String, dynamic>>> eventitems =
      <DateTime, List<Map<String, dynamic>>>{}.obs;

  ///예약가능 여부 시간 순
  final RxList<bool> permittime = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;

  ///등록가능한 올타임
  final RxList<String> regittime = <String>[
    "09:00:00",
    "10:00:00",
    "11:00:00",
    "12:00:00",
    "13:00:00",
    "14:00:00",
    "15:00:00",
    "16:00:00",
    "17:00:00",
    "18:00:00",
    "19:00:00",
    "20:00:00",
  ].obs;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlist();
  }

  ///예약건수 조회
  Future<void> readregitlist() async {
    log('[등록api][readregitlist] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    String today =
        '${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}';
    Map<DateTime, List<Map<String, dynamic>>> event =
        await readregister('/getRegister', {'date': today});
    log('[등록api][readregitlist] 등록성공');
    eventitems.addAll(event);
  }
}
