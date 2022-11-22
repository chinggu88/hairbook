import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair/common/const/appPage.dart';
import 'package:table_calendar/table_calendar.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
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
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () => Get.offNamed(home),
            ),
            label: '홈'),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () => Get.offNamed(book),
            ),
            label: '예약현황'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: '정보'),
      ]),
    );
  }
}
