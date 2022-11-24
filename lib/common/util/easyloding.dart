import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 이지 로딩 초기화
void initEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.grey.withOpacity(0.4)
    ..indicatorColor = const Color(0XFFFFFFFF)
    ..boxShadow = <BoxShadow>[
      BoxShadow(color: Colors.black.withOpacity(0.0)),
    ]
    ..textColor = const Color(0XFFFFFFFF)
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..dismissOnTap = false;
}

/// 로딩 화면 on
Future<void> onEasyLoading({String? message, bool dismissOnTap = false}) async {
  if (!EasyLoading.isShow) {
    await EasyLoading.show(status: message, dismissOnTap: dismissOnTap);
  }
}

/// 로딩 화면 off
Future<void> offEasyLoading() async {
  if (EasyLoading.isShow) await EasyLoading.dismiss();
}
