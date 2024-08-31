import 'package:class_system/models/teacherClassModel.dart';

// 模擬向後端取得老師及課程資訊
List<TeacherInfo> getTeacherClassInfo(){
  final List<TeacherInfo> apiReturnData = [
    TeacherInfo(
        teacherName: "Albert Flores",
        teacherType: "Demonstrator",
        classInfo: [
          ClassInfo(
              className: '基礎程式設計',
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
          ClassInfo(
              className: '人工智慧總整與實作',
              classDay: '每周四',
              startTime: '14:00',
              endTime: '16:00'),
          ClassInfo(
              className: '訊號與系統',
              classDay: '每周五',
              startTime: '18:00',
              endTime: '21:00'),
        ]),
    TeacherInfo(
        teacherName: "Floyd Miles",
        teacherType: "Lecturer",
        classInfo: [
          ClassInfo(
              className: '離散數學',
              classDay: '每周一',
              startTime: '10:00',
              endTime: '12:00'),
          ClassInfo(
              className: '邏輯設計',
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
          ClassInfo(
              className: '計算機結構',
              classDay: '每周四',
              startTime: '18:00',
              endTime: '21:00'),
        ]),
    TeacherInfo(
        teacherName: "Savannah Nguyen",
        teacherType: "Senior Lecturer",
        classInfo: [
          ClassInfo(
              className: '資料結構',
              classDay: '每周三',
              startTime: '10:00',
              endTime: '12:00'),
          ClassInfo(
              className: '系統整合實作(I)',
              classDay: '每周五',
              startTime: '13:00',
              endTime: '15:00'),
        ]),
    TeacherInfo(
        teacherName: "Jenny Wilson",
        teacherType: "Professor",
        classInfo: [
          ClassInfo(
              className: '組合語言',
              classDay: '每周三',
              startTime: '10:00',
              endTime: '12:00'),
          ClassInfo(
              className: 'python程式語言',
              classDay: '每周五',
              startTime: '14:00',
              endTime: '17:00'),
        ]),
    TeacherInfo(
      teacherName: "Cindy", 
      teacherType: "Professor", 
      classInfo: [
      ClassInfo(
          className: 'java程式設計',
          classDay: '每周六',
          startTime: '15:00',
          endTime: '18:00'),
    ]),
  ];
  
  return apiReturnData;
}