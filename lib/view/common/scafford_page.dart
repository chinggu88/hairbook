import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:hair/controller/app_controller.dart';

class Scaffoldhair extends StatelessWidget {
  Scaffoldhair(
      {required this.widgetbody,
      this.shownavigation = true,
      this.showappbar = true,
      this.willpop,
      this.appbar = 0});

  ///네이게이션 표현유무
  bool shownavigation;

  ///appbar 표현유무
  bool showappbar;

  ///바디 widget
  Widget widgetbody;

  ///appbar willpop
  Function()? willpop;

  ///appbar 종류
  int appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: showappbar ? appbartitle(appbar) : appbartitle(99),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          pagenavigation(shownavigation),
          widgetbody,
        ],
      ),
    );
  }

  ///앱바 설정
  PreferredSizeWidget appbartitle(int appbar) {
    switch (appbar) {
      case 1:
        return AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (() {
                willpop != null ? willpop! : Get.back();
              })),
          iconTheme: IconThemeData(color: Colors.black),
        );
      default:
        return AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: Icon(
            Icons.ice_skating,
            size: 40,
          ),
          leadingWidth: 25,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Pay'),
          titleTextStyle: TextStyle(
            fontFamily: 'BMHANNAPro',
            fontSize: 30,
            color: Colors.black,
          ),
          centerTitle: false,
          actions: [
            Icon(Icons.dark_mode_rounded),
            SizedBox(
              width: 10,
            )
          ],
        );
    }
  }

  Widget pagenavigation(bool show) {
    return shownavigation
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(home);
                        AppController.to.index = 0;
                      },
                      child: const Text(
                        '홈',
                        style: TextStyle(
                          fontFamily: 'BMHANNAPro',
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(book);
                        AppController.to.index = 1;
                      },
                      child: const Text(
                        '예약현황',
                        style: TextStyle(
                          fontFamily: 'BMHANNAPro',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppController.to.index == 0
                        ? Container(
                            width: 25,
                            height: 5,
                            color: Colors.black,
                          )
                        : Container(
                            width: 25,
                            height: 5,
                          ),
                    SizedBox(
                      width: 5,
                    ),
                    AppController.to.index == 1
                        ? Container(
                            width: 90,
                            height: 5,
                            color: Colors.black,
                          )
                        : Container(
                            width: 90,
                            height: 5,
                          ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}



// GestureDetector(
//                 onTap: () {
//                   Get.toNamed(home);
//                   AppController.to.index = 0;
//                 },
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           '홈',
//                           style: TextStyle(
//                             fontFamily: 'BMHANNAPro',
//                             fontSize: 30,
//                           ),
//                         ),
//                         const Text(
//                           '예약현황',
//                           style: TextStyle(
//                             fontFamily: 'BMHANNAPro',
//                             fontSize: 30,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         AppController.to.index == 0
//                             ? Container(
//                                 width: 30,
//                                 height: 5,
//                                 color: Colors.black,
//                               )
//                             : Container(
//                                 width: 30,
//                                 height: 5,
//                               ),
//                         AppController.to.index == 1
//                             ? Container(
//                                 width: 100,
//                                 height: 5,
//                                 color: Colors.black,
//                               )
//                             : Container(
//                                 width: 30,
//                                 height: 5,
//                               )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),