import 'dart:async';

import 'package:get/get.dart';
import 'package:hair/common/api/firebase_func.dart';

class homeController extends GetxController {
  static homeController get to => Get.find<homeController>();
  RxBool _anistart = true.obs;
  bool get anistart => _anistart.value;
  set anistart(bool value) => _anistart.value = value;

  Timer? _timer;
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    setanimation();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _timer!.cancel();
  }

  void setanimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _anistart(!_anistart.value);
    });
  }
}
