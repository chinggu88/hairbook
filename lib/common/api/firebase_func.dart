import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair/controller/app_controller.dart';

///serverUrl 셋팅
Future<void> getserverUrl() async {
  log('[Firebasefunc][getserverUrl] 서버 url 가져오기');
  String askUrl = '';
  try {
    final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await FirebaseFirestore.instance
            .collection('com.iksun.jkhair')
            .doc('appinfo')
            .get();

    final Map<String, dynamic>? data = docSnapshot.data();
    log('[Firebasefunc][getserverUrl] data ${data}');
    if (data!.isNotEmpty) {
      askUrl = data['serverurl'] as String;
      AppController.to.serverurl.value = askUrl;
      log('asdf [getserverUrl]${AppController.to.serverurl} ');
    }
  } catch (e) {
    log('', error: '[Firebasefunc][getserverUrl] error value ${e.toString()}');
  }
}
