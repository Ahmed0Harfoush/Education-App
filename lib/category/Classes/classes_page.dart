// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// import 'course_detail_page.dart';
//
//
// class ClassesPage extends StatefulWidget {
//   @override
//   _ClassesPageState createState() => _ClassesPageState();
// }
//
// class _ClassesPageState extends State<ClassesPage> {
//   List<Map<String, dynamic>> courses = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCourses();
//   }
//
//   void _loadCourses() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedCoursesJson = prefs.getString('saved_courses');
//     if (savedCoursesJson != null) {
//       setState(() {
//         courses = List<Map<String, dynamic>>.from(
//           json.decode(savedCoursesJson).map((course) => Map<String, dynamic>.from(course)),
//         );
//       });
//     }
//   }
//
//   void _saveCourses() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('saved_courses', json.encode(courses));
//   }
//
//   void _addCourse() {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController durationController = TextEditingController();
//     final TextEditingController enrolledController = TextEditingController();
//     final TextEditingController imageController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add a Course'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Course Name'),
//                 ),
//                 TextField(
//                   controller: durationController,
//                   decoration: InputDecoration(labelText: 'Course Duration'),
//                 ),
//                 TextField(
//                   controller: enrolledController,
//                   decoration: InputDecoration(labelText: 'Enrolled Students'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextField(
//                   controller: imageController,
//                   decoration: InputDecoration(labelText: 'Course Image URL'),
//                 ),
//                 TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(labelText: 'Course Password'),
//                   keyboardType: TextInputType.number,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 String name = nameController.text;
//                 String duration = durationController.text;
//                 String enrolled = enrolledController.text;
//                 String image = imageController.text;
//                 int password = int.tryParse(passwordController.text) ?? 0;
//
//                 if (name.isNotEmpty && duration.isNotEmpty && enrolled.isNotEmpty && image.isNotEmpty) {
//                   setState(() {
//                     courses.add({
//                       'name': name,
//                       'duration': duration,
//                       'enrolled': enrolled,
//                       'image': image,
//                       'videoPassword': password,
//                       'videos': [],
//                     });
//                   });
//                   _saveCourses();
//                   Navigator.of(context).pop();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Please fill in all fields!')),
//                   );
//                 }
//               },
//               child: Text('Add'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _deleteCourse(int index) {
//     setState(() {
//       courses.removeAt(index);
//       _saveCourses();
//     });
//   }
//
//   void _navigateToCourseDetail(Map<String, dynamic> course) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => CourseDetailPage(course: course),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF674AEF),
//         title: Text('Classes'),
//       ),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.network(courses[index]['image'], fit: BoxFit.cover, width: 50),
//             title: Text(courses[index]['name']),
//             subtitle: Text('Duration: ${courses[index]['duration']} \nEnrolled: ${courses[index]['enrolled']}'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCourse(index),
//                 ),
//               ],
//             ),
//             onTap: () => _navigateToCourseDetail(courses[index]),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addCourse,
//         backgroundColor: Color(0xFF674AEF),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'course_detail_page.dart';

class ClassesPage extends StatefulWidget {
  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  List<Map<String, dynamic>> courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? coursesJson = prefs.getString('courses');
    if (coursesJson != null) {
      List<dynamic> decodedCourses = json.decode(coursesJson);
      setState(() {
        courses = List<Map<String, dynamic>>.from(decodedCourses);
      });
    }
  }

  Future<void> _saveCourses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String coursesJson = json.encode(courses);
    await prefs.setString('courses', coursesJson);
  }

  void _addCourse() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    final TextEditingController enrolledController = TextEditingController();
    final TextEditingController imagePathController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController videoPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a Course'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Course Name'),
                ),
                TextField(
                  controller: durationController,
                  decoration: InputDecoration(labelText: 'Course Duration (in hours)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: enrolledController,
                  decoration: InputDecoration(labelText: 'Number of Enrolled People'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: imagePathController,
                  decoration: InputDecoration(labelText: 'Image Path (local or URL)'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Course Entry Password (Integer)'),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                TextField(
                  controller: videoPasswordController,
                  decoration: InputDecoration(labelText: 'Video Creation Password (Integer)'),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final String name = nameController.text;
                final String duration = durationController.text;
                final int enrolled = int.tryParse(enrolledController.text) ?? 0;
                final String imagePath = imagePathController.text;
                final int? password = int.tryParse(passwordController.text);
                final int? videoPassword = int.tryParse(videoPasswordController.text);

                if (name.isNotEmpty &&
                    duration.isNotEmpty &&
                    enrolled > 0 &&
                    imagePath.isNotEmpty &&
                    password != null &&
                    videoPassword != null) {
                  setState(() {
                    courses.add({
                      'name': name,
                      'duration': duration + ' h',
                      'enrolled': enrolled,
                      'image': imagePath,
                      'password': password,
                      'videoPassword': videoPassword,
                      'videos': []
                    });
                    _saveCourses();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteCourse(Map<String, dynamic> course) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Password to Delete ${course['name']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Video Creation Password'),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final int? inputPassword = int.tryParse(passwordController.text);
                if (inputPassword == course['videoPassword']) {
                  setState(() {
                    courses.remove(course);
                    _saveCourses();
                  });
                  Navigator.of(context).pop(); // Close the password dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Incorrect password!')),
                  );
                }
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _viewCourseDetails(Map<String, dynamic> course) {
    final TextEditingController inputPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Password for ${course['name']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: inputPasswordController,
                decoration: InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final int? inputPassword = int.tryParse(inputPasswordController.text);
                if (inputPassword == course['password']) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(course: course),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Incorrect password!')),
                  );
                }
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          "Classes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Details about Classes',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addCourse,
                child: Text(
                  'Add Course',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF674AEF),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return ListTile(
                      leading: course['image'].isNotEmpty
                          ? Image.network(course['image'], width: 50, height: 50, fit: BoxFit.cover)
                          : SizedBox(width: 50, height: 50),
                      title: Text(course['name']),
                      subtitle: Text('Duration: ${course['duration']} \nEnrolled: ${course['enrolled']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDeleteCourse(course),
                      ),
                      onTap: () => _viewCourseDetails(course),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
