import 'dart:developer';

import 'package:hair/common/api/getConnect.dart';

Future<void> testapi() async {
  try {
    Map<String, dynamic> res =
        await Getconnect.getApi('/logintest', {"id": "111", "text": "222"});
    log('asdf ${res.toString()}');
  } catch (e) {}
}
