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
              Text('헤어종류'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Text('커트'),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    child: Text('펌'),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Text('염색'),
                  ),
                ],
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        color: controller.permittime[0]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('09:00')),
                    Container(
                        color: controller.permittime[1]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('10:00')),
                    Container(
                        color: controller.permittime[2]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('11:00')),
                    Container(
                        color: controller.permittime[3]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('12:00'))
                  ],
                );
              }),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        color: controller.permittime[4]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('13:00')),
                    Container(
                        color: controller.permittime[5]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('14:00')),
                    Container(
                        color: controller.permittime[6]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('15:00')),
                    Container(
                        color: controller.permittime[7]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('16:00'))
                  ],
                );
              }),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        color: controller.permittime[8]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('17:00')),
                    Container(
                        color: controller.permittime[9]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('18:00')),
                    Container(
                        color: controller.permittime[10]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('19:00')),
                    Container(
                        color: controller.permittime[11]
                            ? Colors.grey
                            : Colors.white,
                        child: Text('20:00'))
                  ],
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
}
