import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/const/appPage.dart';
import 'package:hair/controller/login_controller.dart';
import 'package:hair/controller/register_controller.dart';
import 'package:hair/firebase_options.dart';
import 'package:hair/view/book/book_page.dart';
import 'package:hair/view/login_page.dart';
import 'package:hair/view/register_page.dart';
import 'package:hair/view/storage_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(GetMaterialApp(
        onInit: () async {
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          Intl.defaultLocale = 'ko_KR';
        },
        initialRoute: storage,
        getPages: [
          GetPage(
              name: login,
              page: () => const Login_page(),
              binding: BindingsBuilder(() {
                Get.put(LoginController(), permanent: true);
              })),
          GetPage(
              name: storage,
              page: () => const Storage_page(),
              binding: BindingsBuilder(() {
                // Get.put(Splash_controller(), permanent: true);
              })),
          GetPage(
              name: register,
              page: () => RegisterPage(),
              binding: BindingsBuilder(() {
                Get.put(RegisterController());
              })),
          GetPage(
              name: book,
              page: () => BookPage(),
              binding: BindingsBuilder(() {
                // Get.put(RegisterController());
              })),
        ],
      )));
}
