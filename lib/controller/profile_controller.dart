import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();

  ///예약 목록
  RxList<Map<String, dynamic>> eventlist = <Map<String, dynamic>>[].obs;

  ///예약 히스토리 목록
  RxList<Map<String, dynamic>> eventhistory = <Map<String, dynamic>>[].obs;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlistByid();
    await readhistorylist();
  }

  ///예약건수 조회
  Future<void> readregitlistByid() async {
    log('[등록api][readregitlistByid] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    // List<Map<String, dynamic>> event = await readregisterByid(
    //     '/getRegisterByid', {'id': AppController.to.user.id});
    List<Map<String, dynamic>> event = await readregisterByid(
        '/getRegisterByid',
        {'id': AppController.to.user.id, 'date': dateTostr(DateTime.now())});
    log('[등록api][readregitlistByid] 등록성공 ${event}');
    eventlist.addAll(event);
  }

  ///예약건수 조회
  Future<void> readhistorylist() async {
    log('[등록api][readhistorylist] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    List<Map<String, dynamic>> event = await readregisterByid('/gethistory',
        {'id': AppController.to.user.id, 'date': dateTostr(DateTime.now())});
    log('[등록api][readhistorylist] 등록성공 ${event}');
    eventhistory.addAll(event);
  }
}
