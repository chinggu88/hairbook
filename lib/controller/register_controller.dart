import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  Rx<DateTime> onclick = DateTime.now().obs;

  ///선택한 날짜
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
    "19:00:00",
    "20:00:00",
  ].obs;

  List<String> get regittime => _regittime.value;
  set regittime(List<String> value) => _regittime.assignAll(value);

  ///등록 내용
  RxMap<String, dynamic> regitvalue = <String, dynamic>{}.obs;

  ///예약 목록
  RxMap<DateTime, List<Map<String, dynamic>>> eventitems =
      <DateTime, List<Map<String, dynamic>>>{}.obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlist();
    onclick(selectDate);
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
    regitvalue['date'] = dateTostr(selectDate);

    ///예약 승인
    regitvalue['confirm'] = 'N';
    if (regitvalue['managerCode'] == null) {
      Get.snackbar('주의', '선생님을 선택해주세요');
    } else if (regitvalue['typeCode'] == null) {
      Get.snackbar('주의', '종류를 선택해주세요');
    } else if (regitvalue['time'] == null) {
      Get.snackbar('주의', '시간을 선택해주세요');
    }
    log('[등록api][setregiter] 등록내용 value ${regitvalue}');
    callregister('/register', regitvalue).then((value) async {
      if (value) {
        Get.snackbar('성공', '예약성공');

        //예약목록 갱신
        await readregitlist();
        //화면 갱신
        onclick(selectDate);
        //선택화면 갱신
        regitvalue.clear();
      } else {
        Get.snackbar('실패', '예약실패');
      }
    });
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
