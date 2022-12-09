import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:table_calendar/table_calendar.dart';

class BookController extends GetxController {
  static BookController get to => Get.find<BookController>();

  ///현재 달력 포맷
  final Rx<CalendarFormat> _calendarFormat = CalendarFormat.twoWeeks.obs;
  CalendarFormat get calendarFormat => _calendarFormat.value;
  set calendarFormat(CalendarFormat value) => _calendarFormat.value = value;

  ///선택한 날짜
  final Rx<DateTime> _selectDate = DateTime.now().obs;
  DateTime get selectDate => _selectDate.value;
  set selectDate(DateTime value) => _selectDate.value = value;

  Rx<DateTime> onclick = DateTime.now().obs;

  ///달력이벤트 목록
  RxMap<DateTime, List<Map<String, dynamic>>> eventitems =
      <DateTime, List<Map<String, dynamic>>>{}.obs;

  ///예약가능 여부 시간 순
  final RxList<bool> _permittime = <bool>[].obs;
  List<bool> get permittime => _permittime.value;
  set permittime(List<bool> value) => _permittime.assignAll(value);

  ///등록가능한 올타임
  final RxList<String> _regittime = <String>[
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

  List<String> get regittime => _regittime.value;
  set regittime(List<String> value) => _regittime.assignAll(value);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    regittime.forEach((element) {
      permittime.add(false);
    });
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlist();
    permitregister(selectDate);
  }

  ///등록데이터 갱신
  void permitregister(DateTime date) {
    List<bool> temp = [];
    if (eventitems[date] != null) {
      for (int i = 0; i < regittime.length; i++) {
        eventitems[date]?.indexWhere((e) => e['time'] == regittime[i]) == -1
            ? temp.add(false)
            : temp.add(true);
      }
    } else {
      for (int i = 0; i < regittime.length; i++) {
        temp.add(false);
      }
    }
    _permittime.assignAll(temp);
  }

  ///예약건수 조회
  Future<void> readregitlist() async {
    log('[등록api][readregitlist] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    Map<DateTime, List<Map<String, dynamic>>> event =
        await readregister('/getRegister', {'date': dateTostr(DateTime.now())});
    log('[등록api][readregitlist] 등록성공 ${event}');
    eventitems.addAll(event);
  }
}
