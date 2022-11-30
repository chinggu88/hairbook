import 'package:flutter/material.dart';
import 'package:hair/view/common/scafford_page.dart';
import 'package:table_calendar/table_calendar.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      widgetbody: Column(
        children: [
          Center(
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(DateTime.now().year, DateTime.now().month - 3,
                  DateTime.now().day),
              lastDay: DateTime(DateTime.now().year, DateTime.now().month + 3,
                  DateTime.now().day),
            ),
          ),
        ],
      ),
    );
  }
}
