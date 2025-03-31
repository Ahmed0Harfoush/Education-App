import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailPage extends StatefulWidget {
  final Map<String, dynamic> course;

  CourseDetailPage({required this.course});

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late SharedPreferences prefs;
  YoutubePlayerController? _controller;
  int? _currentlyPlayingIndex;

  @override
  void initState() {
    super.initState();
    _loadSavedVideos();
    _loadLastEvent();
  }

  void _loadSavedVideos() async {
    prefs = await SharedPreferences.getInstance();
    String? savedVideosJson = prefs.getString('saved_videos_${widget.course['name']}');
    if (savedVideosJson != null) {
      setState(() {
        widget.course['videos'] = List<Map<String, String>>.from(
          json.decode(savedVideosJson).map((video) => Map<String, String>.from(video)),
        );
      });
    }
  }

  void _saveVideos() async {
    await prefs.setString('saved_videos_${widget.course['name']}', json.encode(widget.course['videos']));
  }

  void _loadLastEvent() async {
    prefs = await SharedPreferences.getInstance();
    String? lastEvent = prefs.getString('last_event');
    if (lastEvent != null) {
      print('Last event: $lastEvent');
      setState(() {
        _currentlyPlayingIndex = int.tryParse(lastEvent);
      });
      if (_currentlyPlayingIndex != null && _currentlyPlayingIndex! < widget.course['videos'].length) {
        _playVideo(widget.course['videos'][_currentlyPlayingIndex!]['url'], _currentlyPlayingIndex!);
      }
    }
  }

  void _saveLastEvent(int index) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_event', index.toString());
  }

  void _addVideo(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController urlController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Video Creation Password'),
          content: TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                int? enteredPassword = int.tryParse(passwordController.text);
                if (enteredPassword == widget.course['videoPassword']) {
                  Navigator.of(context).pop();
                  _showAddVideoDialog(context, nameController, urlController);
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

  void _showAddVideoDialog(BuildContext context, TextEditingController nameController, TextEditingController urlController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a Video'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Video Name'),
                ),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'YouTube URL'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final String name = nameController.text;
                final String url = urlController.text;

                if (name.isNotEmpty && url.isNotEmpty) {
                  String? videoId = YoutubePlayer.convertUrlToId(url);
                  if (videoId != null) {
                    setState(() {
                      widget.course['videos'].add({
                        'name': name,
                        'url': videoId,
                      });
                    });
                    _saveVideos(); // Save the updated video list
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid YouTube URL!')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields!')),
                  );
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

  void _deleteVideo(int index) {
    setState(() {
      widget.course['videos'].removeAt(index);
      if (_currentlyPlayingIndex == index) {
        _currentlyPlayingIndex = null;
        _closeVideo();
      } else if (_currentlyPlayingIndex != null && _currentlyPlayingIndex! > index) {
        _currentlyPlayingIndex = _currentlyPlayingIndex! - 1;
      }
    });
    _saveVideos(); // Save the updated video list
  }

  void _playVideo(String videoId, int index) {
    if (_controller != null) {
      _controller!.dispose();
    }
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
      ),
    );
    setState(() {
      _currentlyPlayingIndex = index;
    });
    _saveLastEvent(index);
  }

  void _closeVideo() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
    setState(() {
      _currentlyPlayingIndex = null;
    });
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("${widget.course['name']}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.course['image'], fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              'Course Duration: ${widget.course['duration']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Enrolled: ${widget.course['enrolled']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Videos:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => _addVideo(context),
              child: Text(
                'Add Video',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF674AEF),
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.course['videos'].length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.course['videos'][index]['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('https://www.youtube.com/watch?v=${widget.course['videos'][index]['url']}'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.play_arrow, color: Colors.green),
                                  onPressed: () => _playVideo(widget.course['videos'][index]['url'], index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteVideo(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (_currentlyPlayingIndex == index)
                        Column(
                          children: [
                            SizedBox(height: 8),
                            Stack(
                              children: [
                                YoutubePlayer(
                                  controller: _controller!,
                                  showVideoProgressIndicator: true,
                                ),
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: IconButton(
                                    icon: Icon(Icons.close, color: Colors.white),
                                    onPressed: _closeVideo,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}























// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CourseDetailPage extends StatefulWidget {
//   final Map<String, dynamic> course;
//
//   CourseDetailPage({required this.course});
//
//   @override
//   _CourseDetailPageState createState() => _CourseDetailPageState();
// }
//
// class _CourseDetailPageState extends State<CourseDetailPage> {
//   late SharedPreferences prefs;
//   YoutubePlayerController? _controller;
//   int? _currentlyPlayingIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedVideos();
//     _loadLastEvent();
//   }
//
//   void _loadSavedVideos() async {
//     prefs = await SharedPreferences.getInstance();
//     String? savedVideosJson = prefs.getString('saved_videos_${widget.course['name']}');
//     if (savedVideosJson != null) {
//       setState(() {
//         widget.course['videos'] = List<Map<String, String>>.from(
//           json.decode(savedVideosJson).map((video) => Map<String, String>.from(video)),
//         );
//       });
//     }
//   }
//
//   void _saveVideos() async {
//     await prefs.setString('saved_videos_${widget.course['name']}', json.encode(widget.course['videos']));
//   }
//
//   void _loadLastEvent() async {
//     prefs = await SharedPreferences.getInstance();
//     String? lastEvent = prefs.getString('last_event');
//     if (lastEvent != null) {
//       setState(() {
//         _currentlyPlayingIndex = int.tryParse(lastEvent);
//       });
//       if (_currentlyPlayingIndex != null && _currentlyPlayingIndex! < widget.course['videos'].length) {
//         _playVideo(widget.course['videos'][_currentlyPlayingIndex!]['url'], _currentlyPlayingIndex!);
//       }
//     }
//   }
//
//   void _saveLastEvent(int index) async {
//     prefs = await SharedPreferences.getInstance();
//     await prefs.setString('last_event', index.toString());
//   }
//
//   void _addVideo(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController urlController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Enter Video Creation Password'),
//           content: TextField(
//             controller: passwordController,
//             decoration: InputDecoration(labelText: 'Password'),
//             obscureText: true,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 int? enteredPassword = int.tryParse(passwordController.text);
//                 if (enteredPassword == widget.course['videoPassword']) {
//                   Navigator.of(context).pop();
//                   _showAddVideoDialog(context, nameController, urlController);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Incorrect password!')),
//                   );
//                 }
//               },
//               child: Text('Submit'),
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
//   void _showAddVideoDialog(BuildContext context, TextEditingController nameController, TextEditingController urlController) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add a Video'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Video Name'),
//                 ),
//                 TextField(
//                   controller: urlController,
//                   decoration: InputDecoration(labelText: 'YouTube URL'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 final String name = nameController.text;
//                 final String url = urlController.text;
//
//                 if (name.isNotEmpty && url.isNotEmpty) {
//                   String? videoId = YoutubePlayer.convertUrlToId(url);
//                   if (videoId != null) {
//                     setState(() {
//                       widget.course['videos'].add({
//                         'name': name,
//                         'url': videoId,
//                       });
//                     });
//                     _saveVideos();
//                     Navigator.of(context).pop();
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Invalid YouTube URL!')),
//                     );
//                   }
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
//   void _deleteVideo(int index) {
//     setState(() {
//       widget.course['videos'].removeAt(index);
//       if (_currentlyPlayingIndex == index) {
//         _currentlyPlayingIndex = null;
//         _closeVideo();
//       } else if (_currentlyPlayingIndex != null && _currentlyPlayingIndex! > index) {
//         _currentlyPlayingIndex = _currentlyPlayingIndex! - 1;
//       }
//     });
//     _saveVideos();
//   }
//
//   void _playVideo(String videoId, int index) {
//     if (_controller != null) {
//       _controller!.dispose();
//     }
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         loop: true,
//       ),
//     );
//     setState(() {
//       _currentlyPlayingIndex = index;
//     });
//     _saveLastEvent(index);
//   }
//
//   void _closeVideo() {
//     if (_controller != null) {
//       _controller!.dispose();
//       _controller = null;
//     }
//     setState(() {
//       _currentlyPlayingIndex = null;
//     });
//   }
//
//   @override
//   void dispose() {
//     if (_controller != null) {
//       _controller!.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF674AEF),
//         title: Text("${widget.course['name']}"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.network(widget.course['image'], fit: BoxFit.cover),
//             SizedBox(height: 16),
//             Text(
//               'Course Duration: ${widget.course['duration']}',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Enrolled: ${widget.course['enrolled']}',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Videos:',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             ElevatedButton(
//               onPressed: () => _addVideo(context),
//               child: Text(
//                 'Add Video',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF674AEF),
//                 textStyle: TextStyle(color: Colors.white),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.course['videos'].length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 8.0),
//                         padding: EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     widget.course['videos'][index]['name'],
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   Text('https://www.youtube.com/watch?v=${widget.course['videos'][index]['url']}'),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.play_arrow, color: Colors.green),
//                                   onPressed: () => _playVideo(widget.course['videos'][index]['url'], index),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete, color: Colors.red),
//                                   onPressed: () => _deleteVideo(index),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (_currentlyPlayingIndex == index)
//                         Column(
//                           children: [
//                             SizedBox(height: 8),
//                             Stack(
//                               children: [
//                                 YoutubePlayer(
//                                   controller: _controller!,
//                                   showVideoProgressIndicator: true,
//                                 ),
//                                 Positioned(
//                                   left: 10,
//                                   top: 10,
//                                   child: IconButton(
//                                     icon: Icon(Icons.close, color: Colors.white),
//                                     onPressed: _closeVideo,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
