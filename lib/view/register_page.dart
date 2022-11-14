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
                    locale: 'ko_KR',
                    daysOfWeekHeight: 30,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(DateTime.now().year,
                        DateTime.now().month - 3, DateTime.now().day),
                    lastDay: DateTime(
                      DateTime.now().year,
                      DateTime.now().month + 3,
                      DateTime.now().day,
                    ),
                    calendarFormat: CalendarFormat.week,
                    onDaySelected: ((selectedDay, focusedDay) {
                      controller.onclick.value = focusedDay;
                      print('asdf ${selectedDay.day} :: ${focusedDay.day}');
                    }),
                    selectedDayPredicate: (day) {
                      print(
                          'asdf selectedDayPredicate ${controller.onclick.value}');
                      return controller.onclick.value == day;
                    },
                    availableCalendarFormats: const {
                      CalendarFormat.week: 'Week'
                    },
                    eventLoader: (day) {
                      return [];
                    },
                    calendarStyle: const CalendarStyle(
                        todayDecoration: const BoxDecoration(
                            color: const Color(0xFF5C6BC0),
                            shape: BoxShape.rectangle),
                        selectedDecoration: const BoxDecoration(
                            color: const Color(0xFF5C6BC0),
                            shape: BoxShape.rectangle)),
                  );
                },
              ),
              Text('확인버튼')
            ],
          ),
        ),
      ),
    );
  }
}
