import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/view/common/scafford_page.dart';

class Storage_page extends StatelessWidget {
  const Storage_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onVerticalDragStart: (details) {
            // log(details.toString());
          },
          onHorizontalDragUpdate: (details) {
            log(details.toString());
          },
          child: Container(
              color: Colors.red,
              height: 400,
              child: Center(child: Text('여약하기')))),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () => Get.offNamed(storage),
            ),
            label: '홈'),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () => Get.offNamed(book),
            ),
            label: '예약현황'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: '정보'),
      ]),
    );
  }
}
