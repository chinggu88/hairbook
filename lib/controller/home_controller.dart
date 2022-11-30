import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/api/firebase_func.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';

class homeController extends GetxController {
  static homeController get to => Get.find<homeController>();

  ///예약 목록
  RxList<Map<String, dynamic>> eventlist = <Map<String, dynamic>>[].obs;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    readregitlistByid();
  }

  ///예약건수 조회
  Future<void> readregitlistByid() async {
    log('[등록api][readregitlistByid] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');

    List<Map<String, dynamic>> event = await readregisterByid(
        '/getRegisterByid',
        {'id': AppController.to.user.id, 'date': dateTostr(DateTime.now())});
    log('[등록api][readregitlistByid] 등록성공 ${event}');
    eventlist.addAll(event);
  }
}
