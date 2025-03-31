// import 'package:education_app/screens/Study/Levels/subject_detail_page.dart';
// import 'package:flutter/material.dart';
//
// class StudyLevel4 extends StatelessWidget {
//   final Map<String, Map<String, dynamic>>? materials;
//
//   const StudyLevel4({super.key, required this.materials});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF674AEF),
//         title: Text("Level 4"),
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

class StudyLevel4 extends StatelessWidget {
  final Map<String, Map<String, dynamic>>? materials;

  const StudyLevel4({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF674AEF),
        title: const Text("Level 4"),
      ),
      body: ListView(
        children: materials!.entries.map((semesterEntry) {
          final semesterKey = semesterEntry.key; // Access semester name
          final semester = semesterEntry.value; // Access semester map

          return Column(
            children: [
              // Container for semester name and picture
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'images/Study/RST (4).png', // Adjusting image path dynamically
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      semesterKey,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Text(semesterKey), // Display semester name
                children: semester['Materials'].entries.map<Widget>((subjectEntry) {
                  final subject = subjectEntry.value; // Access subject map
                  return ListTile(
                    title: Text(subject['title']),
                    subtitle: Text(subject['description']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectDetailPage(
                            title: subject['title'],
                            description: subject['description'],
                            videos: List<Map<String, String>>.from(subject['videos'] ?? []), // Handle potential null
                            books: List<Map<String, String>>.from(subject['books'] ?? []), // Handle potential null
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
