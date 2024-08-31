import 'package:flutter/material.dart';
import 'package:class_system/models/teacherClassModel.dart';
import 'package:class_system/pages/classInfoPage.dart';
import 'package:class_system/services/teacherInfo_service.dart';

// TeacherListPage(講師清單)
class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});
  @override
  State<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherListPage> {
  
  final List<TeacherInfo> data = getTeacherClassInfo();// 模擬向後端取得的數據

  final Map<int, bool> _expandedStates = {};// 展開狀態，用於控制每個標題的icon

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
        title: const Text('講師清單' ,style: TextStyle(fontWeight: FontWeight.bold, ),),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ExpansionTile(

              // 自訂義標題(頭像、教師別類型、教師名稱)
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
                      Text(data[i].teacherType,
                          style: const TextStyle(color: Colors.black54)),
                      Text(data[i].teacherName,
                          style: const TextStyle(color: Colors.black87))
                    ],
                  ),
                ],
              ),

              // 自訂義摺疊按鈕
              trailing: Icon(
                _expandedStates[i] ?? false ? Icons.remove : Icons.add,
                color: Colors.black, 
              ),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  _expandedStates[i] = isExpanded;
                });
              },

              children: [

                // Divider
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: const Divider(color: Colors.black45),
                ),

                // 折疊內容物info(使用 shrinkWrap: true 以限制 ListView 的高度)
                ListView.builder(
                  itemCount: data[i].classInfo.length,
                  itemBuilder: (context, j) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ClassInfoPage(teacherInfo: data[i], classInfo: data[i].classInfo[j]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined, color: Colors.black54),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[i].classInfo[j].className),
                                Text('${data[i].classInfo[j].classDay}, ${data[i].classInfo[j].startTime} ~ ${data[i].classInfo[j].endTime}'),
                              ],
                            ),

                            const Expanded(child: SizedBox(width: 10,)),

                            const Icon(Icons.arrow_forward_ios)
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