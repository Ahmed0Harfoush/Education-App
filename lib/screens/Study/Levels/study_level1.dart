// import 'package:education_app/screens/Study/Levels/subject_detail_page.dart';
// import 'package:flutter/material.dart';
// class StudyLevel1 extends StatelessWidget {
//   final Map<String, Map<String, dynamic>>? materials;
//
//   const StudyLevel1({super.key, required this.materials});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF674AEF),
//         title: Text("Level 1"),
//       ),
//       body: ListView(
//         children: materials!.entries.map((semester) {
//           return ExpansionTile(
//             title: Text(semester.key),
//             children: semester.value['Materials'].entries.map<Widget>((subject) {
//               return ListTile(
//                 title: Text(subject.value['title']),
//                 subtitle: Text(subject.value['description']),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubjectDetailPage(
//                         title: subject.value['title'],
//                         description: subject.value['description'],
//                         videos: List<Map<String, String>>.from(subject.value['videos']),
//                         books: List<Map<String, String>>.from(subject.value['books']),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }













import 'package:education_app/screens/Study/Levels/subject_detail_page.dart';
import 'package:flutter/material.dart';

class StudyLevel1 extends StatelessWidget {
  final Map<String, Map<String, dynamic>>? materials;

  const StudyLevel1({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("Level 1"),
      ),
      body: ListView(
        children: materials!.entries.map((semester) {
          return Column(
            children: [
              // Container for semester name and picture
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/Study/RST (1).png', // Adjusting image path dynamically
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Text(
                      semester.key,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Text(semester.key),
                children: semester.value['Materials'].entries.map<Widget>((subject) {
                  return ListTile(
                    title: Text(subject.value['title']),
                    subtitle: Text(subject.value['description']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectDetailPage(
                            title: subject.value['title'],
                            description: subject.value['description'],
                            videos: List<Map<String, String>>.from(subject.value['videos']),
                            books: List<Map<String, String>>.from(subject.value['books']),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
