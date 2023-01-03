import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hair/controller/book_controller.dart';
import 'package:hair/view/common/scafford_page.dart';
import 'package:table_calendar/table_calendar.dart';

class BookPage extends GetView<BookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      widgetbody: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              calendar(),
              const SizedBox(height: 8.0),
              Expanded(child: test())

              // Obx(
              //   () => Expanded(
              //     child: GridView.count(
              //       childAspectRatio: 1.5,
              //       crossAxisCount: 3,
              //       children: Schecdulelist(controller.eventitems),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Obx calendar() {
    return Obx(
      () {
        log(' ${controller.eventitems.length}');
        return TableCalendar(
          firstDay: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          lastDay: DateTime(DateTime.now().year, DateTime.now().month + 3,
              DateTime.now().day),
          calendarFormat: controller.calendarFormat,
          onFormatChanged: (format) {
            controller.calendarFormat = format;
          },
          focusedDay: controller.onclick.value,
          onDaySelected: (selectedDay, focusedDay) {
            controller.onclick.value = selectedDay;
            controller.permitregister(selectedDay);
            controller.selectDate = DateTime.utc(
                selectedDay.year, selectedDay.month, selectedDay.day);
          },
          selectedDayPredicate: (day) {
            return controller.onclick.value == day;
          },
          eventLoader: (day) {
            return controller.eventitems[day] ?? [];
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
                  controller.eventitems[dateTime] != null
                      ? Container(
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${(12 - controller.eventitems[dateTime]!.length)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${controller.regittime.length}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
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
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${(12 - controller.eventitems[dateTime]!.length)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${controller.regittime.length}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
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
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${(12 - controller.eventitems[dateTime]!.length)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(
                          height: 20,
                          width: 20,
                          color: Colors.blueAccent,
                          child: Text(
                            '${controller.regittime.length}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                ],
              );
            },
          ),
        );
      },
    );
  }

  ///등록 상세내역
  List<Widget> Schecdulelist(Map<DateTime, List<Map<String, dynamic>>> event) {
    List<Widget> reWidget = [];
    for (int i = 0; i < controller.regittime.length; i++) {
      reWidget.add(GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: controller.permittime[i] ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 5),
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
                controller.eventitems[controller.selectDate]![0]['confirm'] ==
                        'N'
                    ? Text('예약중..')
                    : Text('예약확정'),
              ] else ...[
                Text('예약 가능'),
              ]
            ],
          ),
        ),
      ));
    }

    return reWidget;
  }

  Widget test() {
    return Row(
      children: [
        Container(
          color: Colors.red,
          height: 120,
          width: 100,
          child: Text('10:00'),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            height: 120,
            width: 40,
          ),
        ),
      ],
    );
  }
}
