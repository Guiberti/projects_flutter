import 'package:flutter/material.dart';

class MyPageApp extends StatelessWidget {
  const MyPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Olá mundo !!!",
          style: TextStyle(
            fontSize: 20,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
