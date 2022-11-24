import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hair/common/api/firebase_func.dart';
import 'package:hair/firebase_options.dart';
import 'package:hair/model/user_model.dart';

class AppController extends GetxController {
  static AppController get to => Get.find<AppController>();

  ///서버 url
  final RxString _serverurl = 'http://10.0.2.2:8000'.obs;
  String get serverurl => _serverurl.value;
  set serverurl(String value) => _serverurl.value == value;

  ///바텀네비게이션 인덱스
  RxInt _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  ///로그인 데이터
  Rx<User> _user = User().obs;
  User get user => _user.value;
  set user(User value) => _user.value = value;

  ///내부 데이터 저장
  final storage = GetStorage();

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
