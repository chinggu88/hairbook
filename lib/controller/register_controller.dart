import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/model/events_model.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  Rx<DateTime> onclick = DateTime.now().obs;

  ///선택한 날짜
  final Rx<DateTime> _selectDate = DateTime.now().obs;
  DateTime get selectDate => _selectDate.value;
  set selectDate(DateTime value) => _selectDate.value = value;

  ///화면에 그려지는 날짜 리스트
  final RxList<String> _viewDate = <String>[].obs;
  List<String> get viewDate => _viewDate.value;
  set viewDate(List<String> value) => _viewDate.assignAll(value);

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
    "19:00:00",
    "20:00:00",
  ].obs;

  List<String> get regittime => _regittime.value;
  set regittime(List<String> value) => _regittime.assignAll(value);

  ///등록 내용
  RxMap<String, dynamic> regitvalue = <String, dynamic>{}.obs;

  ///예약 목록
  RxMap<DateTime, List<Map<String, dynamic>>> events =
      <DateTime, List<Map<String, dynamic>>>{}.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    readregitlist();
    // readregister('/getRegister', {'date': _viewDate.value});
    // log(_viewDate.value.toString());
  }

  ///등록데이터 갱신
  void permitregister(DateTime date) {
    List<bool> temp = [];
    if (events[date] != null) {
      for (int i = 0; i < regittime.length; i++) {
        events[date]?.indexWhere((e) => e['time'] == regittime[i]) == -1
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

  ///등록api보내기
  void setregiter() {
    regitvalue['id'] = AppController.to.user.id;
    regitvalue['name'] = AppController.to.user.name;
    regitvalue['phone'] = AppController.to.user.phone ?? "";
    regitvalue['date'] =
        '${selectDate.year}${selectDate.month}${selectDate.day}';

    ///예약 승인
    regitvalue['confirm'] = 'N';
    if (regitvalue['managerCode'] == null) {
      Get.snackbar('주의', '선생님을 선택해주세요');
    } else if (regitvalue['typeCode'] == null) {
      Get.snackbar('주의', '종류를 선택해주세요');
    } else if (regitvalue['time'] == null) {
      Get.snackbar('주의', '시간을 선택해주세요');
    }
    log('[등록api][setregiter] 등록밸류 value ${regitvalue}');
    callregister('/register', regitvalue).then((value) {
      if (value) {
        ///로그인정보 확인
        // Get.offNamed(home);
        Get.snackbar('성공', '예약성공');
      } else {
        Get.snackbar('실패', '예약실패');
      }
    });
  }

  Future<void> readregitlist() async {
    log('[등록api][readregitlist] 등록밸류 value ${_viewDate}');
    events
        .addAll(await readregister('/getRegister', {'date': _viewDate.value}));
    // log('asdf ${events.value}');
    _viewDate.clear();
  }
}
