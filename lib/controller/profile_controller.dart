import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();
  final RxBool _anistart = true.obs;
  bool get anistart => _anistart.value;
  set anistart(bool value) => _anistart.value = value;
}
