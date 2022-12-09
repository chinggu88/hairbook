import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/model/book_model.dart';

class homeController extends GetxController {
  static homeController get to => Get.find<homeController>();

  ///예약 목록
  RxList<book> eventlist = <book>[].obs;

  ///과거 예약 목록
  RxList<book> historylist = <book>[].obs;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    readregitlistByid();
    readregitlistByCategory();
  }

  ///예약건수 조회
  Future<void> readregitlistByid() async {
    log('[등록api][readregitlistByid] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    List<book> event = await readregisterByid(
        '/getRegisterByid', {'id': AppController.to.user.id});
    log('[등록api][readregitlistByid]  ${event}');
    event.forEach((e) {
      if (diffDate(e.date!) <= 0) {
        log('asfd ${e.date}');
        eventlist.add(e);
      }
    });
  }

  ///예약 카테고리 조회
  Future<void> readregitlistByCategory() async {
    historylist.clear();
    log('[등록api][readregitlistByCategory] 등록 value ${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}');
    List<book> event = await readregisterByCategory(
        '/gethistoryCategory', {'id': AppController.to.user.id});
    log('[등록api][readregitlistByCategory]  ${event}');
    historylist.addAll(event);
  }
}
