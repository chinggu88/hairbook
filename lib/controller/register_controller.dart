import 'dart:collection';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  Rx<DateTime> onclick = DateTime.now().obs;
  // RxBool bb = false.obs;
  List<String> aa = ['asdf', 'asdf', 'asdf'];
  RxMap events = <DateTime, List<String>>{}.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    DateTime.utc(1989, 11, 9);
    // events.addAll(<DateTime, List<String>>{DateTime.utc(1989, 11, 9), aa});
  }

  // {2022-07-31 00:00:00.000Z: [Event 0 | 1], 2022-08-05 00:00:00.000Z: [Event 1 | 1, Event 1 | 2], 2022-08-10 00:00:00.000Z: [Event 2 | 1, Event 2 | 2, Event 2 | 3], 2022-08-15 00:00:00.000Z: [Event 3 | 1, Event 3 | 2, Event 3 | 3, Event 3 | 4], 2022-08-20 00:00:00.000Z: [Event 4 | 1], 2022-08-25 00:00:00.000Z: [Event 5 | 1, Event 5 | 2], 2022-08-30 00:00:00.000Z: [Event 6 | 1, Event 6 | 2, Event 6 | 3], 2022-09-04 00:00:00.000Z: [Event 7 | 1, Event 7 | 2, Event 7 | 3, Event 7 | 4], 2022-09-09 00:00:00.000Z: [Event 8 | 1], 2022-09-14 00:00:00.000Z: [Event 9 | 1, Event 9 | 2], 2022-09-19 00:00:00.000Z: [Event 10 | 1, Event 10 | 2, Event 10 | 3], 2022-09-24 00:00:00.000Z: [Event 11 | 1, Event 11 | 2, Event 11 | 3, Event 11 | 4], 2022-09-29 00:00:00.000Z: [Event 12 | 1], 2022-10-04 00:00:00.000Z: [Event 13 | 1, Event 13 | 2], 2022-10-09 00:00:00.000Z: [Event 14 | 1, Event 14 | 2, Event 14 | 3], 2022-10-14 00:00:00.000Z: [Event 15 | 1, Event 15 | 2, Event 15 | 3, Event 15 | 4], 2022-10-19 00:00:00.000Z: [Event 16 | 1], 2022-10-24 00:00:00.000Z: [Event 17 | 1, Event 17 | 2], 2022-10-29 00:00:00.000Z: [Event 18 | 1, Event 18 | 2, Event 18 | 3], 2022-11-03 00:00:00.000Z: [Event 19 | 1, Event 19 | 2, Event 19 | 3, Event 19 | 4], 2022-11-08 00:00:00.000Z: [Event 20 | 1], 2022-11-13 00:00:00.000Z: [Event 21 | 1, Event 21 | 2], 2022-11-18 00:00:00.000Z: [Event 22 | 1, Event 22 | 2, Event 22 | 3], 2022-11-23 00:00:00.000Z: [Event 23 | 1, Event 23 | 2, Event 23 | 3, Event 23 | 4], 2022-11-28 00:00:00.000Z: [Event 24 | 1], 2022-12-03 00:00:00.000Z: [Event 25 | 1, Event 25 | 2], 2022-12-08 00:00:00.000Z: [Event 26 | 1, Event 26 | 2, Event 26 | 3], 2022-12-13 00:00:00.000Z: [Event 27 | 1, Event 27 | 2, Event 27 | 3, Event 27 | 4], 2022-12-18 00:00:00.000Z: [Event 28 | 1], 2022-12-23 00:00:00.000Z: [Event 29 | 1, Event 29 | 2], 2022-12-28 00:00:00.000Z: [Event 30 | 1, Event 30 | 2, Event 30 | 3], 2023-01-02 00:00:00.000Z: [Event 31 | 1, Event 31 | 2, Event 31 | 3, Event 31 | 4], 2023-01-07 00:00:00.000Z: [Event 32 | 1], 2023-01-12 00:00:00.000Z: [Event 33 | 1, Event 33 | 2], 2023-01-17 00:00:00.000Z: [Event 34 | 1, Event 34 | 2, Event 34 | 3], 2023-01-22 00:00:00.000Z: [Event 35 | 1, Event 35 | 2, Event 35 | 3, Event 35 | 4], 2023-01-27 00:00:00.000Z: [Event 36 | 1], 2023-02-01 00:00:00.000Z: [Event 37 | 1, Event 37 | 2], 2023-02-06 00:00:00.000Z: [Event 38 | 1, Event 38 | 2, Event 38 | 3], 2023-02-11 00:00:00.000Z: [Event 39 | 1, Event 39 | 2, Event 39 | 3, Event 39 | 4], 2023-02-16 00:00:00.000Z: [Event 40 | 1], 2023-02-21 00:00:00.000Z: [Event 41 | 1, Event 41 | 2], 2023-02-26 00:00:00.000Z: [Event 42 | 1, Event 42 | 2, Event 42 | 3], 2023-03-03 00:00:00.000Z: [Event 43 | 1, Event 43 | 2, Event 43 | 3, Event 43 | 4], 2023-03-08 00:00:00.000Z: [Event 44 | 1], 2023-03-13 00:00:00.000Z: [Event 45 | 1, Event 45 | 2], 2023-03-18 00:00:00.000Z: [Event 46 | 1, Event 46 | 2, Event 46 | 3], 2023-03-23 00:00:00.000Z: [Event 47 | 1, Event 47 | 2, Event 47 | 3, Event 47 | 4], 2023-03-28 00:00:00.000Z: [Event 48 | 1], 2023-04-02 00:00:00.000Z: [Event 49 | 1, Event 49 | 2], 2022-11-15 02:17:54.788383: [Today's Event 1, Today's Event 2]}
}
