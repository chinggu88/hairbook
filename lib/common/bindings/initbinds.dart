import 'package:get/instance_manager.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/controller/login_controller.dart';

class initbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
  }
}
