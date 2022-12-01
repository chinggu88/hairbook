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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx((() {
              // log('[REGISTERPAGE] ${controller.eventitems.length}');
              // log('[BOOKRPAGE] ${controller.onclick}');
              return calendar();
            })),
            const SizedBox(height: 8.0),
            schedule()
          ],
        ),
      ),
    );
  }

  Widget calendar() {
    return TableCalendar(
      firstDay: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDay: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
      calendarFormat: controller.calendarFormat,
      onFormatChanged: (format) {
        controller.calendarFormat = format;
      },
      focusedDay: controller.onclick.value,
      onDaySelected: (selectedDay, focusedDay) {
        controller.readregitlist();
        controller.onclick.value = selectedDay;
      },
      selectedDayPredicate: (day) {
        return controller.onclick.value == day;
      },
    );
  }

  Widget schedule() {
    log('asdf ${controller.calendarFormat}');
    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 20,
                color: Colors.red,
                child: Text('asdf'),
              ),
            );
          },
        ),
      ),
    );
  }
}
