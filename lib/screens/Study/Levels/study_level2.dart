// import 'package:flutter/material.dart';
// import 'subject_detail_page.dart';
//
// class StudyLevel2 extends StatelessWidget {
//   final Map<String, Map<String, dynamic>>? materials;
//
//   const StudyLevel2({super.key, required this.materials});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF674AEF),
//         title: const Text("Level 2"),
//       ),
//       body: ListView(
//         children: materials!.entries.map((semesterEntry) {
//           final semester = semesterEntry.value; // Access semester map
//           return ExpansionTile(
//             title: Text(semesterEntry.key), // Display semester name
//             children: semester['Materials'].entries.map<Widget>((subjectEntry) {
//               final subject = subjectEntry.value; // Access subject map
//               return ListTile(
//                 title: Text(subject['title']),
//                 subtitle: Text(subject['description']),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SubjectDetailPage(
//                         title: subject['title'],
//                         description: subject['description'],
//                         videos: List<Map<String, String>>.from(subject['videos'] ?? []), // Handle potential null
//                         books: List<Map<String, String>>.from(subject['books'] ?? []), // Handle potential null
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
















import 'package:flutter/material.dart';
import 'subject_detail_page.dart';

class StudyLevel2 extends StatelessWidget {
  final Map<String, Map<String, dynamic>>? materials;

  const StudyLevel2({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF674AEF),
        title: const Text("Level 2"),
      ),
      body: ListView(
        children: materials!.entries.map((semesterEntry) {
          final semesterKey = semesterEntry.key; // Access semester name
          final semester = semesterEntry.value; // Access semester map

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
                      'images/Study/RST (2).png', // Adjusting image path dynamically
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Text(
                      semesterKey,
                      style: TextStyle(
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
