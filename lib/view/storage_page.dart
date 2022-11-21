import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/view/common/scafford_page.dart';

class Storage_page extends StatelessWidget {
  const Storage_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: Get.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(register);
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(register);
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
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
