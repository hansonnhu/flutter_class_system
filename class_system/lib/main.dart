import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 定義 primaryColor
        primaryColorLight: Colors.black,

        // 定義 appBar
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: const MyHomePage(title: '講師清單'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  //#region 實例化data
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
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
        ]),
    TeacherInfo(
        teacherName: "Floyd Miles",
        teacherType: "Lecturer",
        classInfo: [
          ClassInfo(
              className: '基礎程式設計',
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
        ]),
    TeacherInfo(
        teacherName: "Savannah Nguyen",
        teacherType: "Senior Lecturer",
        classInfo: [
          ClassInfo(
              className: '基礎程式設計',
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
        ]),
    TeacherInfo(
        teacherName: "Jenny Wilson",
        teacherType: "Professor",
        classInfo: [
          ClassInfo(
              className: '基礎程式設計',
              classDay: '每周二',
              startTime: '10:00',
              endTime: '12:00'),
        ]),
    TeacherInfo(teacherName: "Cindy", teacherType: "Professor", classInfo: [
      ClassInfo(
          className: '基礎程式設計',
          classDay: '每周二',
          startTime: '10:00',
          endTime: '12:00'),
    ]),
  ];
  //#endregion
  Map<int, bool> _expandedStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context); // 返回
          },
        ),
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: apiReturnData.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(apiReturnData[i].teacherType,
                          style: const TextStyle(color: Colors.black54)),
                      Text(apiReturnData[i].teacherName,
                          style: const TextStyle(color: Colors.black87))
                    ],
                  ),
                ],
              ),

              trailing: Icon(
                _expandedStates[i] ?? false ? Icons.remove : Icons.add,
                color: Colors.black, // 自定义图标颜色
              ),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  _expandedStates[i] = isExpanded;
                });
              },

              children: [
                // Divider
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: const Divider(color: Colors.black45),
                ),

                // 折疊內容物info(使用 shrinkWrap: true 以限制 ListView 的高度)
                ListView.builder(
                  itemCount: apiReturnData[i].classInfo.length,
                  itemBuilder: (context, j) {
                    return InkWell(
                      onTap:(){
                        
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(apiReturnData[i].classInfo[j].className),
                                Text(apiReturnData[i].classInfo[j].classDay +
                                    ', ' +
                                    apiReturnData[i].classInfo[j].startTime +
                                    ' ~ ' +
                                    apiReturnData[i].classInfo[j].endTime),
                              ],
                            ),
                            

                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true, // 使 ListView 依據內容調整高度
                  physics: const NeverScrollableScrollPhysics(), // 禁止滾動
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
