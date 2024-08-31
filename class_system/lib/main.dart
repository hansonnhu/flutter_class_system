import 'package:flutter/material.dart';
import 'package:class_system/pages/teacherListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calss system demo',
      theme: ThemeData(

        // 設定 primaryColor
        primaryColorLight: Colors.black,

        // 定義 appBar
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: const TeacherListPage(),
    );
  }
}
