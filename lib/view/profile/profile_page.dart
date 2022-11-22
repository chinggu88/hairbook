import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hair/view/common/scafford_page.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldhair(
      widgetbody: Center(
          child: Text(
        '프로필 화면입니다.',
      )),
    );
  }
}
