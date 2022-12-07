import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/model/book_model.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();

  ///예약 히스토리 목록
  RxList<book> eventlist = <book>[].obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await readregitlistByid();
  }

  ///예약건수 조회
  Future<void> readregitlistByid() async {
    log('[등록api][readregitlistByid] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    List<book> event = await readregisterByid(
        '/getRegisterByid', {'id': AppController.to.user.id});
    log('[등록api][readregitlistByid] 등록성공 ${event}');
    eventlist.addAll(event);
  }
}
