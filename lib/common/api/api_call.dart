import 'dart:developer';

import 'package:hair/common/api/getConnect.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/model/events_model.dart';
import 'package:hair/model/user_model.dart';
import 'package:intl/intl.dart';

///최초로그인
Future<bool> calllogin(String url, Map<String, dynamic> body) async {
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      AppController.to.user = User.fromJson(res['data]']);
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
      AppController.to.user = User.fromJson(res['data']);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    log('', error: '[api_call][calllogin] error value ${e.toString()}');
    return false;
  }
}

///예약하기
Future<bool> callregister(String url, Map<String, dynamic> body) async {
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    log('', error: '[api_call][calllogin] error value ${e.toString()}');
    return false;
  }
}

///예약목록
Future<Map<DateTime, List<Map<String, dynamic>>>> readregister(
    String url, Map<String, dynamic> body) async {
  Map<DateTime, List<Map<String, dynamic>>> result = {};
  Map<String, dynamic> temp = {};
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      temp = res['data'];
      temp.forEach((key, value) {
        List<Map<String, dynamic>> v = [];
        value.forEach((e) {
          v.add(e);
        });
        result[DateTime.utc(
            int.parse(key.substring(0, 4)),
            int.parse(key.substring(4, 6)),
            int.parse(key.substring(6, 8)))] = v;
      });
      return result;
    } else {
      return result;
    }
  } catch (e) {
    log('', error: '[api_call][readregister] error value ${e.toString()}');
    return {};
  }
}

///예약목록
Future<List<Map<String, dynamic>>> readregisterByid(
    String url, Map<String, dynamic> body) async {
  List<Map<String, dynamic>> result = [];
  List<dynamic> temp = [];
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      temp = res['data'];
      temp.forEach((e) {
        result.add(e);
      });
      return result;
    } else {
      return result;
    }
  } catch (e) {
    log('', error: '[api_call][readregister] error value ${e.toString()}');
    return [];
  }
}

///예약목록
Future<List<Map<String, dynamic>>> readhistory(
    String url, Map<String, dynamic> body) async {
  List<Map<String, dynamic>> result = [];
  List<dynamic> temp = [];
  try {
    Map<String, dynamic> res = await Getconnect.postApi(url, body);
    if (res.isNotEmpty) {
      temp = res['data'];
      temp.forEach((e) {
        result.add(e);
      });
      return result;
    } else {
      return result;
    }
  } catch (e) {
    log('', error: '[api_call][readregister] error value ${e.toString()}');
    return [];
  }
}
