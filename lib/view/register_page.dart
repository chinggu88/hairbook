import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/controller/register_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class RegisterPage extends StatelessWidget {
  var controller = RegisterController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (() {
              Get.back();
            })),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('선생님'),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return Container(
                      width: Get.size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                controller.selectvalue('managerName', '김아무개'),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Container(
                                child: Text('김아무개'),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: controller
                                                  .regitvalue['managerName'] ==
                                              '김아무개'
                                          ? Colors.black
                                          : Colors.white,
                                      width: 5),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                controller.selectvalue('managerName', '이아무개'),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Container(
                                child: Text('이아무개'),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: controller
                                                  .regitvalue['managerName'] ==
                                              '이아무개'
                                          ? Colors.black
                                          : Colors.white,
                                      width: 5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ],
              ),
              Text('헤어종류'),
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectvalue('typename', '커트'),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Text(
                            '커트',
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: controller.regitvalue['typename'] == '커트'
                                    ? Colors.black
                                    : Colors.white,
                                width: 5),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectvalue('typename', '펌'),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Text(
                            '펌',
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: controller.regitvalue['typename'] == '펌'
                                    ? Colors.black
                                    : Colors.white,
                                width: 5),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectvalue('typename', '염색'),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Text(
                            '염색',
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: controller.regitvalue['typename'] == '염색'
                                    ? Colors.black
                                    : Colors.white,
                                width: 5),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text('시간대 설정'),
              Obx(
                () {
                  log('${controller.onclick.value}');
                  return TableCalendar(
                    //언어설정
                    locale: 'ko_KR',
                    //캘린더 높이
                    daysOfWeekHeight: 30,
                    focusedDay: controller.onclick.value,
                    firstDay: DateTime(DateTime.now().year,
                        DateTime.now().month - 3, DateTime.now().day),
                    lastDay: DateTime(
                      DateTime.now().year,
                      DateTime.now().month + 3,
                      DateTime.now().day,
                    ),
                    //캘린더 초기 포맷
                    calendarFormat: CalendarFormat.week,
                    //캘린더 선택시
                    onDaySelected: ((selectedDay, focusedDay) {
                      print('adsf $selectedDay $focusedDay');
                      controller.onclick.value = selectedDay;
                      controller.selectDate = DateTime.utc(
                          selectedDay.year, selectedDay.month, selectedDay.day);
                      controller.permitregister(selectedDay);
                    }),
                    selectedDayPredicate: (day) {
                      return controller.onclick.value == day;
                    },
                    //캘린더 포맷 가능 종류
                    availableCalendarFormats: const {
                      CalendarFormat.week: 'Week'
                    },
                    //캘린더 스케줄
                    eventLoader: (day) {
                      return controller.test![day] ?? [];
                    },
                    calendarStyle: const CalendarStyle(
                      markersMaxCount: 0,
                      todayDecoration: BoxDecoration(
                          color: Color(0xFF5C6BC0), shape: BoxShape.rectangle),
                      selectedDecoration: BoxDecoration(
                          color: Color(0xFF5C6BC0), shape: BoxShape.rectangle),
                    ),
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, dateTime, focusedDay) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                                child: Container(
                              width: 50,
                              height: 40,
                              color: Colors.amberAccent,
                              child: Center(
                                child: Text(
                                  dateTime.day.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )),
                            controller.test![dateTime] != null
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    color: Colors.blueAccent,
                                    child: Text(
                                      '${controller.test![dateTime]?.length.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : Container()
                          ],
                        );
                      },
                      defaultBuilder: (context, dateTime, _) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                                child: Text(
                              dateTime.day.toString(),
                              style: TextStyle(fontSize: 20),
                            )),
                            controller.test![dateTime] != null
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    color: Colors.blueAccent,
                                    child: Text(
                                      '${controller.test![dateTime]?.length.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : Container()
                          ],
                        );
                      },
                      selectedBuilder: (context, dateTime, focusedDay) {
                        log('asdf ${dateTime} ${focusedDay}');
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Container(
                                width: 50,
                                height: 40,
                                color: Colors.amberAccent,
                                child: Center(
                                    child: Text(
                                  dateTime.day.toString(),
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            ),
                            controller.test![dateTime] != null
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    color: Colors.blueAccent,
                                    child: Text(
                                      '${controller.test![dateTime]?.length.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : Container()
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              Obx(() {
                return Container(
                  height: 300,
                  child: GridView.count(
                    childAspectRatio: 1.5,
                    crossAxisCount: 3,
                    children: Schecdulelist(controller.test!),
                  ),
                );
              }),
              SizedBox(
                height: 40,
              ),
              Text('확인버튼')
            ],
          ),
        ),
      ),
    );
  }

  ///등록 상세내역
  List<Widget> Schecdulelist(Map<DateTime, List<Map<String, dynamic>>> event) {
    List<Widget> reWidget = [];
    for (int i = 0; i < controller.regittime.length; i++) {
      reWidget.add(GestureDetector(
        onTap: () => controller.selectvalue("time", controller.regittime[i]),
        child: Container(
          decoration: BoxDecoration(
            color: controller.permittime[i] ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: controller.regitvalue['time'] ==
                        controller.regittime[i].toString()
                    ? Colors.black
                    : Colors.white,
                width: 5),
          ),
          child: Column(
            children: [
              Text(controller.regittime[i].toString()),
              if (controller.permittime[i]) ...[
                Text(controller.test![controller.selectDate]![0]['typename']
                    .toString()),
                Text(controller.test![controller.selectDate]![0]['managerName']
                    .toString()),
                Text(controller.test![controller.selectDate]![0]['confirm']
                    .toString()),
              ]
            ],
          ),
        ),
      ));
    }

    return reWidget;
  }
}
