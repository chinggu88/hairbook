import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:uuid/uuid.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  ///오토로그인여부
  RxBool isAutologin = true.obs;

  final box = GetStorage();

  @override
  Future<void> onReady() async {
    super.onReady();
    autologin();
  }

  ///Google 소셜 로그인용 코드
  Future<bool> signInWithGoogle() async {
    log('[Login][signInWithGoogle] 구글 로그인 시작..');
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final token = await FirebaseMessaging.instance.getToken();
      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      log('[Login][signInWithGoogle] 구글 로그인 성공..');
      log('[Login][signInWithGoogle] ---------------------------------------------------------------------------------------------');
      log('[Login][signInWithGoogle] email : ${user.user!.email}');
      log('[Login][signInWithGoogle] displayName : ${user.user!.displayName}');
      log('[Login][signInWithGoogle] phoneNumber : ${user.user!.phoneNumber}');
      log('[Login][signInWithGoogle] photoURL : ${user.user!.photoURL}');
      log('[Login][signInWithGoogle] uid : ${user.user!.uid}');
      log('[Login][signInWithGoogle] fcmkey : ${token}');
      log('[Login][signInWithGoogle] ---------------------------------------------------------------------------------------------');
      Map<String, dynamic> temp = {
        "id": user.user!.email,
        "name": user.user!.displayName,
        "fcmkey": token,
        "phone": "",
        "type": "0",
        "photoURL": user.user!.photoURL,
        "uid": user.user!.uid,
        "insertdate":
            DateFormat("yyyy-MM-DD HH:mm:SS").format(DateTime.now()).toString(),
        "updatedate":
            DateFormat("yyyy-MM-DD HH:mm:SS").format(DateTime.now()).toString(),
      };
      calllogin('/login', temp).then((value) async {
        if (value) {
          //로그인 데이터 저장
          setlogindata(user.user!.email!, user.user!.uid);
          //홈화면으로 이동
          Get.offNamed(home);
        }
      });
    } catch (error) {
      log('', error: '[Login][signInWithGoogle] Error Message : $error');
      return false;
    }
    return true;
  }

  ///Apple 소셜 로그인용 코드
  Future<bool> signInWithApple() async {
    log('[Login][signInWithApple] TYPE : Future<bool> , 파라미터 : ');
    bool isAvailable = await SignInWithApple.isAvailable();
    //ios 13버전 이상인지 이하인지 체크 후 로그인, isAvailable이 true일 경우 13버전 이상.
    if (isAvailable) {
      try {
        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
            clientId: 'com.coredax.plant.web',
            redirectUri: Uri.parse(
                'https://rift-buttery-eagle.glitch.me/callbacks/sign_in_with_apple'),
          ),
        );
        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          accessToken: appleCredential.authorizationCode,
        );
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
        log('애플계정으로 로그인 성공');
      } catch (error) {
        log('애플계정으로 로그인 실패',
            error: '[Login][signInWithApple] Error Message : $error');
        return false;
      }
      return true;
    } else {
      try {
        final clientState = Uuid().v4();
        final url = Uri.https('appleid.apple.com', '/auth/authorize', {
          'response_type': 'code id_token',
          'client_id': "com.coredax.plant.web",
          'response_mode': 'form_post',
          'redirect_uri':
              'https://rift-buttery-eagle.glitch.me/callbacks/apple/sign_in_with_apple',
          'scope': 'email name',
          'state': clientState,
        });

        final result = await FlutterWebAuth.authenticate(
            url: url.toString(), callbackUrlScheme: "applink");

        final body = Uri.parse(result).queryParameters;
        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: body['id_token'],
          accessToken: body['code'],
        );
        log('애플계정으로 로그인 성공');
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      } catch (error) {
        log('애플계정으로 로그인 실패',
            error: '[Login][signInWithApple] Error Message : $error');
        return false;
      }
      return true;
    }
  }

  ///kakao 소셜 로그인용 코드
  Future<bool> signInWithKakao() async {
    log('[Login][signInWithKakao] TYPE : Future<bool> , 파라미터 : ');
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        log('카카오톡으로 로그인 성공');
        return true;
      } catch (error) {
        log('카카오계정으로 로그인 실패',
            error: '[Login][signInWithKakao] Error Message : $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          log('카카오계정으로 로그인 성공');
          return true;
        } catch (error) {
          log('카카오계정으로 로그인 실패',
              error: '[Login][signInWithKakao] Error Message : $error');
          return false;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        log('카카오계정으로 로그인 성공');
        return true;
      } catch (error) {
        log('카카오계정으로 로그인 실패',
            error: '[Login][signInWithKakao] Error Message : $error');
        return false;
      }
    }
  }

  ///로그인 데이터 저장
  Future<void> setlogindata(String id, String uid) async {
    log('[Login][setlogindata] 로그인 데이터 저장.');
    bool isinit = await AppController.to.storage.initStorage;
    if (isinit) {
      AppController.to.storage.write("id", id);
      AppController.to.storage.write("uid", uid);
    }
    log('[Login][setlogindata] 로그인 데이터 저장성공.');
    log('[Login][setlogindata] 로그인 데이터 ID ${AppController.to.storage.read("id")}');
    log('[Login][setlogindata] 로그인 데이터 UID ${AppController.to.storage.read("uid")}');
  }

  ///자동로그인
  Future<void> autologin() async {
    log('[Login][autologin] 자동 로그인 실행');
    bool isinit = await AppController.to.storage.initStorage;
    try {
      String id = AppController.to.storage.read("id");
      String uid = AppController.to.storage.read("uid");
      //아이디랑 uid 정보가 있을때
      if (id != '' && uid != '') {
        Map<String, dynamic> body = {"id": id, "uid": uid};
        callloginfo('/logininfo', body).then((value) {
          if (value) {
            ///로그인정보 확인
            Get.offNamed(home);
          }
        });
      }
    } catch (e) {
      log('', error: '[Login][autologin] 자동 로그인 실패 error : ${e.toString()}');
    }
  }
}
