import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/common/util/function.dart';
import 'package:hair/controller/app_controller.dart';
import 'package:hair/controller/home_controller.dart';
import 'package:hair/view/common/scafford_page.dart';

class Home_page extends GetView<homeController> {
  const Home_page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      showappbar: false,
      widgetbody: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0.0) {
            Get.toNamed(register);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                profile(),
                SizedBox(
                  height: 20,
                ),
                //예약현황
                Obx(() => recentbook()),
                SizedBox(
                  height: 20,
                ),
                //예약히스토리
                Obx(() => bookhisyory()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //프로필위젯
  Widget profile() {
    return Container(
        width: Get.size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0,
              blurRadius: 2.0,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.network('https://picsum.photos/250?image=9'),
                  ),
                  radius: 40,
                  backgroundColor: Colors.black,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${AppController.to.user.name}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'BMHANNAAir',
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '${AppController.to.user.id}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'BMHANNAAir',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  //최근 예약 화면
  Widget recentbook() {
    List<Widget> list = [];
    controller.eventlist.forEach(
      (e) {
        list.add(Container(
            width: Get.size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 0,
                  blurRadius: 2.0,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.cut,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 90,
                    width: 2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    diffDate(e.date!) == 0 ? '오늘' : ' ${diffDate(e.date!)}일후',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BMHANNAAir',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${strToKorDate(e.date!)}',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'BMHANNAAir',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    e.confirm == 'N' ? '예약획인중' : '예약완료',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'BMHANNAAir',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )));
        list.add(SizedBox(
          height: 20,
        ));
      },
    );
    return Container(
      height: 120,
      child: ListView(
        reverse: true,
        // padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        children: list,
      ),
    );
  }

  Widget bookhisyory() {
    List<Widget> list = [];
    controller.historylist.forEach(
      (e) {
        list.add(Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 0,
                  blurRadius: 2.0,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    '${e.typeName}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BMHANNAAir',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${e.managerName}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BMHANNAAir',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      e.date = '';
                      e.time = '';
                      Get.toNamed(register, arguments: e.toJson());
                    },
                    child: Text(
                      '빠른예약',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'BMHANNAAir',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )));
        list.add(SizedBox(
          height: 20,
          width: 20,
        ));
      },
    );
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: list,
      ),
    );
  }
}
