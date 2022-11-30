import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/api/api_call.dart';
import 'package:hair/common/const/appPage.dart';
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
          child: Text('SingleChildScrollView'),
        ),
      ),
    );
  }
}
