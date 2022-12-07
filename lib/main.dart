import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hair/common/bindings/initbinds.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/controller/book_controller.dart';
import 'package:hair/controller/home_controller.dart';
import 'package:hair/controller/login_controller.dart';
import 'package:hair/controller/profile_controller.dart';
import 'package:hair/controller/register_controller.dart';
import 'package:hair/view/book/book_page.dart';
import 'package:hair/view/home/register_page.dart';
import 'package:hair/view/home/home_page.dart';
import 'package:hair/view/login_page.dart';
import 'package:hair/view/profile/profile_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting().then((_) async {
    runApp(GetMaterialApp(
      onInit: () async {
        Intl.defaultLocale = 'ko_KR';
      },
      initialRoute: login,
      initialBinding: initbinding(),
      getPages: [
        GetPage(
            name: login,
            page: () => const Login_page(),
            binding: BindingsBuilder(() {
              Get.put(LoginController());
            })),
        GetPage(
            name: home,
            page: () => const Home_page(),
            transition: Transition.noTransition,
            binding: BindingsBuilder(() {
              Get.put(homeController());
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
            transition: Transition.noTransition,
            binding: BindingsBuilder(() {
              Get.put(BookController());
            })),
        GetPage(
            name: profile,
            page: () => Profile_page(),
            transition: Transition.noTransition,
            binding: BindingsBuilder(() {
              Get.put(ProfileController());
            })),
      ],
      builder: EasyLoading.init(),
    ));
  });
}
