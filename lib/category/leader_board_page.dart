import 'package:flutter/material.dart';
import 'dart:convert'; // For decoding JSON data
import 'package:shared_preferences/shared_preferences.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<Map<String, String>> completedCourses = [];

  @override
  void initState() {
    super.initState();
    _loadCompletedCourses(); // Load completed courses on page load
  }

  Future<void> _loadCompletedCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedCourses = prefs.getStringList('completedCourses') ?? [];

    setState(() {
      completedCourses = savedCourses.map((courseJson) {
        return Map<String, String>.from(jsonDecode(courseJson)); // Decode and store each course info
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          "LeaderBoard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: completedCourses.isEmpty
            ? Center(child: Text('No completed courses yet.'))
            : ListView.builder(
          itemCount: completedCourses.length,
          itemBuilder: (context, index) {
            final course = completedCourses[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      course['courseName']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      course['message']!,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Image.asset(course['image']!), // Display certificate image
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}