import 'package:education_app/screens/VideoPlayerScreen_videopPlayer_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/youtube_video_section.dart';
import '../widgets/description_screen.dart';
import '../widgets/videos_section.dart';

class CourseScreen extends StatefulWidget {
  final String courseName;
  final List<String> courseVideos;
  final Map<String, dynamic> courseDetails;

  CourseScreen({required this.courseName, required this.courseVideos, required this.courseDetails});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isVideosSection = true;
  int videosListenedTo = 0; // Counter for videos listened to
  double completionPercentage = 0.0; // Percentage completion

  @override
  void initState() {
    super.initState();
    _loadCompletionPercentage(); // Load saved completion percentage
  }

  Future<void> _loadCompletionPercentage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      videosListenedTo =
          prefs.getInt(widget.courseName) ?? 0; // Retrieve saved value
      completionPercentage = (videosListenedTo / widget.courseVideos.length) *
          100; // Calculate percentage
    });
  }

  Future<void> _markVideoAsListened() async {
    setState(() {
      if (videosListenedTo < widget.courseVideos.length) {
        videosListenedTo++;
        completionPercentage =
            (videosListenedTo / widget.courseVideos.length) * 100;
      }
    });
    await _saveCompletionPercentage();
    await _updateCompletion(); // Check and update the LeaderBoard
  }

  Future<void> _saveCompletionPercentage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget.courseName,
        videosListenedTo); // Save the number of videos listened to
  }

  // Function to update the LeaderBoard based on completion status
  Future<void> _updateCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (completionPercentage < 100) {
      // Remove the course from the LeaderBoard if completion drops below 100%
      await _removeCompletedCourse();
    } else {
      // If the course is completed, save it to the LeaderBoard
      await _saveCompletedCourse();
    }
  }

  // Function to save a completed course to the LeaderBoard
  Future<void> _saveCompletedCourse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedCourses = prefs.getStringList('completedCourses') ??
        [];

    Map<String, String> courseInfo = {
      'courseName': widget.courseName,
      'message': 'Congratulations on completing the ${widget
          .courseName} course!',
      'image': 'images/cover/Padge_complete.png' // Updated image path
    };

    completedCourses.add(
        jsonEncode(courseInfo)); // Add encoded course details to the list
    await prefs.setStringList(
        'completedCourses', completedCourses); // Save the list
  }

  // Function to remove a completed course from the LeaderBoard
  Future<void> _removeCompletedCourse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedCourses = prefs.getStringList('completedCourses') ??
        [];

    // Remove the course from the list if it's present
    completedCourses.removeWhere((courseJson) {
      Map<String, dynamic> course = jsonDecode(courseJson);
      return course['courseName'] == widget.courseName;
    });

    // Save the updated list back to SharedPreferences
    await prefs.setStringList('completedCourses', completedCourses);
  }

  // Reset the progress to zero when replay is tapped
  Future<void> _resetCourseProgress() async {
    setState(() {
      videosListenedTo = 0;
      completionPercentage = 0.0;
    });
    await _saveCompletionPercentage();
    await _removeCompletedCourse(); // Also remove from leaderboard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.courseName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Color(0xFF674AEF),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("images/language/${widget.courseName}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF674AEF),
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "${widget.courseName} Complete Course",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Created by Dear Programmer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${widget.courseVideos.length} Videos",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Completion: ${completionPercentage.toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                if (completionPercentage == 100)
                  IconButton(
                    icon: Icon(Icons.replay, color: Color(0xFF674AEF)),
                    onPressed: _resetCourseProgress,
                  ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: isVideosSection ? Color(0xFFF5F3FF) : Color(0xFFF5F3FF)
                    .withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: isVideosSection
                        ? Color(0xFF674AEF).withOpacity(0.6)
                        : Color(0xFF674AEF),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Text(
                          "Videos",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: isVideosSection ? Color(0xFF674AEF) : Color(
                        0xFF674AEF).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isVideosSection
                ? DescriptionScreen(courseDetails: widget.courseDetails)
                : Column(
              children: widget.courseVideos
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String videoUrl = entry.value;
                String videoTitle = "Video ${index +
                    1}"; // You can replace this with actual titles if available

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerPage(
                                videoUrl: videoUrl,
                                videoTitle: videoTitle,
                              ),
                        ),
                      );
                      _markVideoAsListened(); // Mark video as listened when tapped
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                              Icons.play_circle_fill, color: Color(0xFF674AEF)),
                          SizedBox(width: 10),
                          Text(
                            videoTitle,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}







