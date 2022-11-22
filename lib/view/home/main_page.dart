import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/controller/home_controller.dart';
import 'package:hair/view/common/scafford_page.dart';

class Main_page extends GetView<homeController> {
  const Main_page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      showappbar: false,
      widgetbody: GestureDetector(
          onTap: () {
            controller.anistart = !controller.anistart;
          },
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0.0) {
              Get.toNamed(register);
            }
          },
          child: Stack(children: [
            Center(
                child: Image.asset(
              'images/main/testmain.jpg',
              width: Get.size.width,
              height: Get.size.height,
              fit: BoxFit.fill,
            )),
            Obx(
              () => AnimatedPositioned(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blueAccent,
                ),
                right: controller.anistart ? 300 : 50,
                top: controller.anistart ? 300 : 50,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
              ),
            ),
          ])),
    );
  }
}
