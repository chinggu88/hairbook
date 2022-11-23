import 'package:flutter/material.dart';
import 'package:hair/view/common/scafford_page.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
        widgetbody: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: CircleAvatar(
              // child: Image.network(
              //   'https://cdn.imweb.me/thumbnail/20221024/1c7b541efd331.jpg',
              // ),
              radius: 100,
              backgroundColor: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blueAccent,
          ),
        ),
      ],
    ));
  }
}
