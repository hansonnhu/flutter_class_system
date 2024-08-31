// 課程詳細資訊頁面
import 'package:flutter/material.dart';
import 'package:class_system/models/teacherClassModel.dart';

class ClassInfoPage extends StatelessWidget {
  final TeacherInfo teacherInfo;
  final ClassInfo classInfo;

  final String className;
  final String teacherName;
  final String classDay;
  final String startTime;
  final String endTime;

  ClassInfoPage({
    super.key, 
    required this.teacherInfo,
    required this.classInfo
  }) :  className = classInfo.className, 
        teacherName = teacherInfo.teacherName,
        classDay = classInfo.classDay,
        startTime = classInfo.startTime,
        endTime = classInfo.endTime;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(className, style: const TextStyle(fontWeight: FontWeight.bold, ),),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '教師名稱 : ${teacherInfo.teacherName}(${teacherInfo.teacherType})',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  '上課時間 : $classDay, $startTime ~ $endTime',
                  style: const TextStyle(fontSize: 20),
                ),
              ]),
      ), 
      
    );
  }
}