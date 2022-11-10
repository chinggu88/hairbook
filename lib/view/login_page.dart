import 'package:flutter/material.dart';
import 'package:hair/controller/login_controller.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                LoginController.to.signInWithGoogle();
              },
              icon: Icon(Icons.abc_sharp))
        ],
      ),
    );
  }
}
