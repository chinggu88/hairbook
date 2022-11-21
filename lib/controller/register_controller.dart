import 'dart:collection';
import 'dart:developer';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  Rx<DateTime> onclick = DateTime.now().obs;

  final Rx<DateTime> _selectDate = DateTime.now().obs;
  DateTime get selectDate => _selectDate.value;
  set selectDate(DateTime value) => _selectDate.value = value;

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

  // RxBool bb = false.obs;
  List<String> aa = ['asdf', 'asdf', 'asdf'];
  RxMap events = <DateTime, List<Map<String, dynamic>>>{}.obs;
  Map<DateTime, List<Map<String, dynamic>>>? test = {
    DateTime.utc(2022, 11, 15): [
      {
        "time": "11:00:00",
        "typename": "커트",
        "typeCode": "01",
        "phone": "01022049564",
        "managerName": "아무개",
        "ManageCode": "01",
        "confirm": "N"
      },
      {
        "time": "12:00:00",
        "typename": "커트",
        "typeCode": "01",
        "phone": "01022049564",
        "managerName": "아무개",
        "ManageCode": "01",
        "confirm": "N"
      },
      {
        "time": "13:00:00",
        "typename": "펌",
        "typeCode": "02",
        "phone": "01022049564",
        "managerName": "아무개",
        "ManageCode": "01",
        "confirm": "N"
      },
      {
        "time": "14:00:00",
        "typename": "펌",
        "typeCode": "02",
        "phone": "01022049564",
        "managerName": "아무개",
        "ManageCode": "01",
        "confirm": "N"
      },
    ],
  };
  //   String? _time;
  // String? _typeName;
  // String? _typeCode;
  // String? _phone;
  // String? _managerName;
  // String? _managerCode;
  // String? _confirm;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void permitregister(DateTime date) {
    List<bool> temp = [];
    if (test![date] != null) {
      test![date]?.indexWhere((e) => e['time'] == '09:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '10:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '11:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '12:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '13:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '14:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '15:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '16:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '17:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '18:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '19:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
      test![date]?.indexWhere((e) => e['time'] == '20:00:00') == -1
          ? temp.add(false)
          : temp.add(true);
    } else {
      temp = [
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
      ];
    }
    _permittime.assignAll(temp);
    log(_permittime.toList().toString());
  }
}
