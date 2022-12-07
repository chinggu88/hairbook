// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hair/controller/app_controller.dart';
// import 'package:hair/controller/profile_controller.dart';
// import 'package:hair/view/common/scafford_page.dart';

// class Profile_page extends GetView<ProfileController> {
//   const Profile_page({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffoldhair(
//         widgetbody: Column(
//       children: [
//         photoimage(),
//         Obx(() {
//           log('${controller.eventlist.length}');
//           return controller.eventlist != null ? regitlist() : Container();
//         }),
//         Obx(
//           () {
//             // log('${controller.eventhistory.length}');
//             return Container(
//               width: Get.size.width * 0.9,
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.9),
//                     spreadRadius: 0,
//                     blurRadius: 2.0,
//                     offset: Offset(0, 5), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: regithistory(),
//               ),
//             );
//           },
//         )
//       ],
//     ));
//   }

//   ///프로필 이미지
//   Widget photoimage() {
//     return Expanded(
//       flex: 1,
//       child: Container(
//         child: CircleAvatar(
//           child: ClipOval(
//             child: Image.network(
//               '${AppController.to.user.photoURL}',
//             ),
//           ),
//           radius: 100,
//           backgroundColor: Colors.black,
//         ),
//       ),
//     );
//   }

//   ///예약현황
//   Widget regitlist() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           width: Get.size.width * 0.9,
//           child: Container(
//             height: 100,
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     Text('예약현황'),
//                     Icon(
//                       Icons.hail_rounded,
//                       size: 50,
//                       color: Colors.white,
//                     ),
//                     Text(controller.eventlist == null ? "" : "데이터가 있음")
//                   ],
//                 ),
//                 Text('${controller.eventlist[0]['date']}'),
//                 Text('${controller.eventlist[0]['typeName']}'),
//                 Text('${controller.eventlist[0]['time']}'),
//               ],
//             ),
//             decoration: BoxDecoration(
//               color: Colors.teal,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.9),
//                   spreadRadius: 0,
//                   blurRadius: 2.0,
//                   offset: Offset(0, 5), // changes position of shadow
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   ///과거예약리스트
//   List<Widget> regithistory() {
//     List<Widget> result = [];
//     controller.eventhistory.forEach((e) {
//       result.add(Row(
//         children: [
//           Text(
//             '${e['typeName']}',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             '${e['time']}',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             '${e['date']}',
//             style: TextStyle(color: Colors.white),
//           ),
//         ],
//       ));
//     });
//     return result;
//   }
// }
