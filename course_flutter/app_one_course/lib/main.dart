import 'package:app_one_course/my_page_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// Tipos de widget
// StatefulWidget - com estado - se precisar mudar algo na tela
// StatelessWidget - sem estado - imutavel
// InheritedWidget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPageApp()
    );
  } 
}
