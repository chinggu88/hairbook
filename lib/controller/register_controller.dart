import 'dart:collection';
import 'dart:developer';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  Rx<DateTime> onclick = DateTime.now().obs;

  final Rx<DateTime> _selectDate = DateTime.now().obs;
  DateTime get selectDate => _selectDate.value;
  set selectDate(DateTime value) => _selectDate.value = value;

  ///예약가능 여부 시간 순
  final RxList<bool> _permittime = <bool>[
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
    "18:00:00",
    "20:00:00",
  ].obs;

  List<String> get regittime => _regittime.value;
  set regittime(List<String> value) => _regittime.assignAll(value);

  ///등록 내용
  RxMap<String, dynamic> regitvalue = <String, dynamic>{}.obs;

  RxMap events = <DateTime, List<Map<String, dynamic>>>{}.obs;
  Map<DateTime, List<Map<String, dynamic>>>? test = {
    DateTime.utc(2022, 11, 15): [
      {
        "time": "11:00:00",
        "typename": "커트",
        "typeCode": "01",
        "phone": "01022049564",
        "managerName": "아무개",
        "managerCode": "01",
        "confirm": "N"
      },
      {
        "time": "12:00:00",
        "typename": "커트",
        "typeCode": "01",
        "phone": "01022049564",
        "managerName": "아무개",
        "managerCode": "01",
        "confirm": "N"
      },
      {
        "time": "13:00:00",
        "typename": "펌",
        "typeCode": "02",
        "phone": "01022049564",
        "managerName": "아무개",
        "managerCode": "01",
        "confirm": "N"
      },
      {
        "time": "14:00:00",
        "typename": "펌",
        "typeCode": "02",
        "phone": "01022049564",
        "managerName": "아무개",
        "managerCode": "01",
        "confirm": "N"
      },
    ],
  };

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  ///등록데이터 갱신
  void permitregister(DateTime date) {
    List<bool> temp = [];
    if (test![date] != null) {
      for (int i = 0; i < regittime.length; i++) {
        test![date]?.indexWhere((e) => e['time'] == regittime[i]) == -1
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

  ///클릭한 예약 내역
  void selectvalue(String title, String value) {
    regitvalue[title] = value;
    if (value == '커트') {
      regitvalue['typeCode'] = '01';
    } else if (value == '펌') {
      regitvalue['typeCode'] = '02';
    } else if (value == '염색') {
      regitvalue['typeCode'] = '03';
    } else if (value == '김아무개') {
      regitvalue['managerCode'] = '01';
    } else if (value == '이아무개') {
      regitvalue['managerCode'] = '02';
    }
    log('selectvalue ${regitvalue}');
  }
}
