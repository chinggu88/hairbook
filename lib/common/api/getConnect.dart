import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:hair/common/const/error_message.dart';
import 'package:hair/common/util/easyloding.dart';
import 'package:hair/controller/app_controller.dart';

class Getconnect {
  Getconnect._();
  static final GetConnect _connect = GetConnect()
    ..baseUrl = ''
    ..timeout = const Duration(seconds: 10);
  static final erm = errorMessge();

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
    onEasyLoading();
    // EasyLoading.show();
    Map<String, dynamic> returnmodel = {};
    try {
      log('[RESTAPI][postApi]ULR : ${AppController.to.serverurl} : ${url}, PARAM : $body');
      final response =
          await _connect.post(AppController.to.serverurl + url, body);

      if (response.statusCode == 200) {
        log('[RESTAPI][postApi] statusCode = ${response.statusCode} body = ${response.body}');
        if (response.body['code'] != 'C0000') {
          GetSnackBar(title: 'test', message: erm.error_message['status_code']);
        }
        returnmodel = response.body;
      } else {
        log('',
            error:
                '[RESTAPI][postApi] Error Message : 통신오류 error code = ${response.statusCode}  error text = ${response.statusText}');
      }
    } catch (e) {
      log('', error: '[RESTAPI][postApi] Error Message : ${e.toString()}');
    }
    offEasyLoading();
    return returnmodel;
  }
}
