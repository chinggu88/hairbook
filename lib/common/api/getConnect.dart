import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:hair/controller/app_controller.dart';

class Getconnect {
  Getconnect._();
  static final GetConnect _connect = GetConnect()
    ..baseUrl = ''
    ..timeout = const Duration(seconds: 10);

  ///GET방식 통신 내부 서버 통신
  static Future<Map<String, dynamic>> getApi(String url) async {
    Map<String, dynamic> returnmodel = {};
    try {
      final response = await _connect.get(AppController.to.serverurl + url);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseMap = jsonDecode(response.body);
      } else {
        log('',
            error:
                '[RESTAPI][getApi] Error Message : 통신오류 error code = ${response.statusCode}  error text = ${response.statusText}');
      }
    } catch (e) {
      log('', error: '[RESTAPI][getApi] Error Message : ${e.toString()}');
    }
    return returnmodel;
  }

  ///POST방식 통신 내부 서버 통신
  static Future<Map<String, dynamic>> postApi(
      String url, Map<String, dynamic> body) async {
    Map<String, dynamic> returnmodel = {};
    try {
      final response =
          await _connect.post(AppController.to.serverurl + url, body);

      if (response.statusCode == 200) {
        returnmodel = response.body;
      } else {
        log('',
            error:
                '[RESTAPI][postApi] Error Message : 통신오류 error code = ${response.statusCode}  error text = ${response.statusText}');
      }
    } catch (e) {
      log('', error: '[RESTAPI][postApi] Error Message : ${e.toString()}');
    }
    return returnmodel;
  }
}
