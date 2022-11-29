import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //contner1
  Widget container() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }

  //contner1
  Widget container1() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}
