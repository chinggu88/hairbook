import 'dart:developer';

import 'package:hair/common/api/getConnect.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/model/user_model.dart';

///최초로그인
Future<bool> calllogin(String url, Map<String, dynamic> body) async {
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      AppController.to.user = User.fromJson(res);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    log('', error: '[api_call][calllogin] error value ${e.toString()}');
    return false;
  }
}

///자동 로그인 시 유저 정보 가져오기
Future<bool> callloginfo(String url, Map<String, dynamic> body) async {
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      AppController.to.user = User.fromJson(res);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    log('', error: '[api_call][calllogin] error value ${e.toString()}');
    return false;
  }
}
