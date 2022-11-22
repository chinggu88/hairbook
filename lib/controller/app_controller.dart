import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hair/common/api/firebase_func.dart';
import 'package:hair/firebase_options.dart';

class AppController extends GetxController {
  static AppController get to => Get.find<AppController>();

  ///서버 url
  final RxString _serverurl = ''.obs;
  String get serverurl => _serverurl.value;
  set serverurl(String value) => _serverurl.value == value;

  ///바텀네비게이션 인덱스
  RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await getserverUrl();
  }
}
