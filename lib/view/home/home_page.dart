import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
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
                recentbook(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //프로필위젯
  Widget profile() {
    return Stack(
      children: [
        Container(
            width: Get.size.width,
            height: 150,
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
                        child:
                            Image.network('https://picsum.photos/250?image=9'),
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
                          '이강훈님',
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
                          'chinggu88@gmail.com',
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
            )),
      ],
    );
  }

  //최근 예약 화면
  Widget recentbook() {
    return Container(
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
                '예약정보',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BMHANNAAir',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
