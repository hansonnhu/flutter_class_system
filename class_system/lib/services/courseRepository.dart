import 'package:http/http.dart' as http;
import 'dart:convert';

// 課程資訊 Model
class CourseModel {
  final String courseId;
  final String courseName;
  final String description;
  final String courseDay;
  final String startTime;
  final String endTime;
  final String teacherName;

  CourseModel({
    required this.courseId,
    required this.courseName,
    required this.description,
    required this.courseDay,
    required this.startTime,
    required this.endTime,
    required this.teacherName,
  });

  // 將 JSON 資料轉換為 CourseModel 物件
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseId: json['courseId'],
      courseName: json['courseName'],
      description: json['description'],
      courseDay: json['courseDay'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      teacherName: json['teacherName'],
    );
  }
}

// 講師資訊 Model (因為學生與講師有相同的資訊，所以用 User 類別來處理)
// 依照 role 分類 user，可能有 教授、副教授、講師、資深講師、學生等等
class UserModel{
  final String userId;
  final String userName;
  final String role;

  UserModel({
    required this.userId,
    required this.userName,
    required this.role,   
  });

  // 將 JSON 資料轉換為 UserModel 物件
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      role: json['role'],
    );
  }
}



class CourseRepository {
  final String baseUrl;
  final http.Client client;

  CourseRepository({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  // 所有授課列表資訊
  Future<List<CourseModel>> fetchCourses() async {
    final response = await client.get(Uri.parse('$baseUrl/courses'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  // 所有講師列表
  Future<List<UserModel>> fetchTeachers() async {
    final response = await client.get(Uri.parse('$baseUrl/teachers'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load teachers');
    }
  }

  // 以 teacherId 取得該講師所開之所有課程
  Future<List<CourseModel>> fetchCoursesByTeacher(int teacherId) async {
    final response = await client.get(Uri.parse('$baseUrl/teachers/$teacherId/courses'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses for teacher');
    }
  }

  // 建立新講師，將 user 資訊送出，並且交給後端設定 role
  Future<UserModel> createTeacher(UserModel teacher) async {
    final response = await client.post(
      Uri.parse('$baseUrl/teachers'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(UserModel),
    );
    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create teacher');
    }
  }

  // 建立新課程，CourseId 為 null，則代表是新增，並且回傳該課程物件
  Future<CourseModel> createCourse(CourseModel course) async {
    final response = await client.post(
      Uri.parse('$baseUrl/courses'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(course),
    );
    if (response.statusCode == 201) {
      return CourseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create course');
    }
  }

  // 更新課程，有 CourseId，則為更新，並且回傳該課程物件
  Future<CourseModel> updateCourse(CourseModel course) async {
    final response = await client.post(
      Uri.parse('$baseUrl/courses'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(course),
    );
    if (response.statusCode == 201) {
      return CourseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update course');
    }
  }

  // 依據 CourseId 刪除課程
  Future<void> deleteCourse(int courseId) async {
    final response = await client.delete(Uri.parse('$baseUrl/courses/$courseId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete course');
    }
  }
}