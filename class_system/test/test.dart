import 'package:flutter_test/flutter_test.dart';
import 'package:class_system/services/courseRepository.dart';

void main() {
  const String baseUrl = "http://localhost:3000";

  test('測試 fetch 所有授課列表', () async{
    final repository = CourseRepository(baseUrl: '$baseUrl/courses'); // 實例化物件並初始化
    
    final courses = await repository.fetchCourses();
    expect(courses, isNotNull);// 確認物件不為空

  });

  test('測試 fetch 所有講師列表', () async{
    final repository = CourseRepository(baseUrl: '$baseUrl/teachers'); // 實例化物件並初始化
    
    final teachers = await repository.fetchTeachers();
    expect(teachers, isNotNull);

  });

  test('測試 update 課程資訊功能', () async{
    final repository = CourseRepository(baseUrl: '$baseUrl/teachers'); // 實例化物件並初始化
    
    CourseModel updateCourse = CourseModel(
      courseId: "0001", 
      courseName: "testCourseName", 
      description: "testCourseDescription", 
      courseDay: "每周三", 
      startTime: "10:00",
      endTime: "12:00",
      teacherName: "testTeacherName",
    );

    final returnCourse = await repository.updateCourse(updateCourse);
    expect(returnCourse, isNotNull);// 確認物件不為空
    expect(returnCourse.courseId,  equals(updateCourse.courseId));// 確認愈更新課程 id 與回傳的課程 id 相同

  });
}
