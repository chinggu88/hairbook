import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:hair/controller/app_controller.dart';

class Getconnect {
  Getconnect._();
  static final GetConnect _connect = GetConnect()
    ..baseUrl = ''
    ..timeout = const Duration(seconds: 10);

  ///POST방식 통신 내부 서버 통신(개발중)
  static Future<Map<String, dynamic>> getApi(String url, Map body) async {
    Map<String, dynamic> returnmodel = {};
    log('asdf ${AppController.to.serverurl.value + url}');
    try {
      final response =
          await _connect.post(AppController.to.serverurl.value + url, body);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = jsonDecode(response.body);
      } else {
        log('',
            error:
                '[RESTAPI][nongsaro_Get] Error Message : 통신오류 error code = ${response.statusCode}  error text = ${response.statusText}');
      }
    } catch (e) {
      log('', error: '[RESTAPI][nongsaro_Get] Error Message : ${e.toString()}');
    }
    return returnmodel;
  }
}
