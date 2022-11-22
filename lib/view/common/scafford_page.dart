import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';

class Scaffoldhair extends StatelessWidget {
  Scaffoldhair(
      {required this.widgetbody,
      this.showbottomnavigation = true,
      this.showappbar = true,
      this.willpop,
      this.appbar = 0});

  ///네이게이션 표현유무
  bool showbottomnavigation;

  ///appbar 표현유무
  bool showappbar;

  ///바디 widget
  Widget widgetbody;

  ///appbar willpop
  Function()? willpop;

  ///appbar 종류
  int appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showappbar ? appbartitle(appbar) : null,
      body: widgetbody,
      bottomNavigationBar: showbottomnavigation
          ? BottomNavigationBar(items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.abc),
                    onPressed: () => Get.offNamed(home),
                  ),
                  label: '홈'),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.abc),
                    onPressed: () => Get.offNamed(book),
                  ),
                  label: '예약현황'),
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: '정보'),
            ])
          : null,
    );
  }

  ///앱바 설정
  PreferredSizeWidget appbartitle(int appbar) {
    switch (appbar) {
      case 1:
        return AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (() {
                willpop != null ? willpop! : Get.back();
              })),
          iconTheme: IconThemeData(color: Colors.black),
        );
      default:
        return AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          iconTheme: IconThemeData(color: Colors.black),
        );
    }
  }
}
