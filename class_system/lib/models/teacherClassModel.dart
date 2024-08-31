// 創建老師及課程資訊class
class TeacherInfo {
  final String teacherName;
  final String teacherType;
  final List<ClassInfo> classInfo;

  TeacherInfo({
    required this.teacherName,
    required this.teacherType,
    required this.classInfo,
  });
}

class ClassInfo {
  final String className;
  final String classDay;
  final String startTime;
  final String endTime;

  ClassInfo({
    required this.className,
    required this.classDay,
    required this.startTime,
    required this.endTime,
  });
}