import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/controller/register_controller.dart';
import 'package:hair/view/common/scafford_page.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class RegisterPage extends StatelessWidget {
  var controller = RegisterController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      appbar: 1,
      widgetbody: SingleChildScrollView(
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
                    return deginerkind();
                  }),
                ],
              ),
              Text('헤어종류'),
              Obx(
                () {
                  return hairkind();
                },
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Text('시간대 설정'),
              // calendar(),
              Obx(
                () {
                  log('[REGISTERPAGE] ${controller.eventitems.length}');
                  log('[REGISTERPAGE] ${controller.onclick}');
                  return calendar();
                },
              ),
              Obx(() {
                log('[REGISTERPAGE] ${controller.eventitems.length}');
                return Container(
                  height: 230,
                  child: GridView.count(
                    childAspectRatio: 1.6,
                    crossAxisCount: 3,
                    children: Schecdulelist(controller.eventitems),
                  ),
                );
              }),
              GestureDetector(
                  onTap: () => controller.setregiter(), child: Text('확인버튼'))
            ],
          ),
        ),
      ),
      showbottomnavigation: false,
    );
  }

  ///디자이너 선택
  Widget deginerkind() {
    return Container(
      width: Get.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.selectvalue('managerName', '김아무개'),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Container(
                child: Center(
                  child: Text(
                    '김아무개',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: controller.regitvalue['managerName'] == '김아무개'
                          ? Colors.black
                          : Colors.white,
                      width: 5),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.selectvalue('managerName', '이아무개'),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Container(
                child: Center(
                    child: Text(
                  '이아무개',
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: controller.regitvalue['managerName'] == '이아무개'
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
  }

  ///헤어종류
  Widget hairkind() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => controller.selectvalue('typeName', '커트'),
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
                  color: controller.regitvalue['typeName'] == '커트'
                      ? Colors.black
                      : Colors.white,
                  width: 5),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => controller.selectvalue('typeName', '펌'),
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
                  color: controller.regitvalue['typeName'] == '펌'
                      ? Colors.black
                      : Colors.white,
                  width: 5),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => controller.selectvalue('typeName', '염색'),
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
                  color: controller.regitvalue['typeName'] == '염색'
                      ? Colors.black
                      : Colors.white,
                  width: 5),
            ),
          ),
        ),
      ],
    );
  }

  ///캘린더 내역
  Widget calendar() {
    return TableCalendar(
      //언어설정
      locale: 'ko_KR',
      //캘린더 높이
      daysOfWeekHeight: 30,
      focusedDay: controller.onclick.value,
      firstDay: DateTime.now(),
      lastDay: DateTime(
        DateTime.now().year,
        DateTime.now().month + 3,
        DateTime.now().day,
      ),
      //캘린더 초기 포맷
      calendarFormat: CalendarFormat.week,
      //캘린더 선택시
      onDaySelected: ((selectedDay, focusedDay) {
        controller.onclick.value = selectedDay;
        controller.selectDate =
            DateTime.utc(selectedDay.year, selectedDay.month, selectedDay.day);
        controller.permitregister(selectedDay);
      }),
      selectedDayPredicate: (day) {
        return controller.onclick.value == day;
      },
      //캘린더 포맷 가능 종류
      availableCalendarFormats: const {CalendarFormat.week: 'Week'},
      //캘린더 스케줄
      eventLoader: (day) {
        return controller.eventitems[day] ?? [];
      },
      onPageChanged: (focusedDay) async {
        // await controller.readregitlist();
      },
      calendarStyle: const CalendarStyle(
        markersMaxCount: 0,
        todayDecoration:
            BoxDecoration(color: Color(0xFF5C6BC0), shape: BoxShape.rectangle),
        selectedDecoration:
            BoxDecoration(color: Color(0xFF5C6BC0), shape: BoxShape.rectangle),
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
              controller.eventitems[dateTime] != null
                  ? Container(
                      height: 15,
                      width: 15,
                      color: Colors.blueAccent,
                      child: Text(
                        '${controller.eventitems[dateTime]?.length.toString()}',
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
              controller.eventitems[dateTime] != null
                  ? Container(
                      height: 15,
                      width: 15,
                      color: Colors.blueAccent,
                      child: Text(
                        '${controller.eventitems[dateTime]?.length.toString()}',
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
              controller.eventitems[dateTime] != null
                  ? Container(
                      height: 15,
                      width: 15,
                      color: Colors.blueAccent,
                      child: Text(
                        '${controller.eventitems[dateTime]?.length.toString()}',
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
  }

  ///등록 상세내역
  List<Widget> Schecdulelist(Map<DateTime, List<Map<String, dynamic>>> event) {
    List<Widget> reWidget = [];
    for (int i = 0; i < controller.regittime.length; i++) {
      reWidget.add(GestureDetector(
        onTap: () {
          if (!controller.permittime[i]) {
            controller.selectvalue("time", controller.regittime[i]);
          } else {
            Get.snackbar('주의', '이미 예약이 존재합니다.');
          }
        },
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
                Text(controller.eventitems[controller.selectDate]![0]
                        ['typeName']
                    .toString()),
                Text(controller.eventitems[controller.selectDate]![0]
                        ['managerName']
                    .toString()),
                Text(controller.eventitems[controller.selectDate]![0]['confirm']
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
