// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class SubjectDetailPage extends StatelessWidget {
//   final String title;
//   final String description;
//   final List<Map<String, String>> videos; // List of videos with names, YouTube URLs, and descriptions
//   final List<Map<String, String>> books; // List of books with titles and paths
//
//   const SubjectDetailPage({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.videos,
//     required this.books,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF674AEF),
//         title: Text(title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text(
//               description,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "Videos:",
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             ...videos.map((video) => ListTile(
//               title: Text(video['name']!),
//               subtitle: Text(video['description']!), // Display video description
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => YouTubeVideoPlayerScreen(
//                       videoUrl: video['path']!,
//                       videoName: video['name']!, // Pass video name
//                       videoDescription: video['description']!, // Pass video description
//                     ),
//                   ),
//                 );
//               },
//             )).toList(),
//             const SizedBox(height: 16),
//             Text(
//               "Books:",
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             ...books.map((book) => ListTile(
//               title: Text(book['title']!),
//               onTap: () {
//                 launchURL(book['path']!); // Open the book link
//               },
//             )).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class YouTubeVideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;
//   final String videoName; // Video name for AppBar
//   final String videoDescription; // Video description
//
//   const YouTubeVideoPlayerScreen({
//     super.key,
//     required this.videoUrl,
//     required this.videoName,
//     required this.videoDescription,
//   });
//
//   @override
//   _YouTubeVideoPlayerScreenState createState() =>
//       _YouTubeVideoPlayerScreenState();
// }
//
// class _YouTubeVideoPlayerScreenState extends State<YouTubeVideoPlayerScreen> {
//   late YoutubePlayerController _controller;
//   bool _isMuted = false; // Track mute state
//
//   @override
//   void initState() {
//     super.initState();
//     String videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF674AEF),
//         title: Text(widget.videoName), // Display video name in AppBar
//       ),
//       body: Column(
//         children: [
//           YoutubePlayer(
//             controller: _controller,
//             showVideoProgressIndicator: true,
//             onReady: () {
//               _controller.play();
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Description:",
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(widget.videoDescription), // Display video description
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           _isMuted = !_isMuted;
//                           _controller.setVolume(_isMuted ? 0 : 100); // Mute/unmute sound
//                         });
//                       },
//                       icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
//                       label: Text(_isMuted ? 'Unmute' : 'Mute'),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _controller.seekTo(const Duration(seconds: 0)); // Restart video
//                         _controller.play();
//                       },
//                       icon: const Icon(Icons.refresh),
//                       label: const Text('Restart'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Function to launch URLs for books
// void launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }


















//
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class SubjectDetailPage extends StatelessWidget {
//   final String title;
//   final String description;
//   final List<Map<String, String>> videos;
//   final List<Map<String, String>> books;
//
//   const SubjectDetailPage({
//     Key? key,
//     required this.title,
//     required this.description,
//     this.videos = const [],
//     this.books = const [],
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF674AEF),
//         title: Text(title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text(
//               description,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Videos:",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             ...videos.map((video) => ListTile(
//               title: Text(video['name'] ?? 'Unnamed Video'),
//               subtitle: Text(video['description'] ?? 'No description available'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => YouTubeVideoPlayerScreen(
//                       videoUrl: video['path']!,
//                       videoName: video['name']!,
//                     ),
//                   ),
//                 );
//               },
//             )),
//             const SizedBox(height: 16),
//             const Text(
//               "Books:",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             ...books.map((book) => ListTile(
//               title: Text(book['title'] ?? 'Unnamed Book'),
//               onTap: () {
//                 launchURL(book['path']!);
//               },
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class YouTubeVideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;
//   final String videoName;
//
//   const YouTubeVideoPlayerScreen({
//     Key? key,
//     required this.videoUrl,
//     required this.videoName,
//   }) : super(key: key);
//
//   @override
//   _YouTubeVideoPlayerScreenState createState() =>
//       _YouTubeVideoPlayerScreenState();
// }
//
// class _YouTubeVideoPlayerScreenState extends State<YouTubeVideoPlayerScreen> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF674AEF),
//         title: Text(widget.videoName),
//       ),
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//       ),
//     );
//   }
// }
//
// // Function to launch URL for books
// void launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }


















import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SubjectDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final List<Map<String, String>> videos; // List of videos with names, YouTube URLs, and descriptions
  final List<Map<String, String>> books; // List of books with titles and paths

  const SubjectDetailPage({
    Key? key,
    required this.title,
    required this.description,
    this.videos = const [], // Default empty list if null
    this.books = const [],  // Default empty list if null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF674AEF),
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              "Videos:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ...videos.map((video) => ListTile(
              title: Text(video['name'] ?? 'Unnamed Video'),
              subtitle: Text(video['description'] ?? 'No description available'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubeVideoPlayerScreen(
                      videoUrl: video['path']!,
                      videoName: video['name']!,
                      videoDescription: video['description']!,
                    ),
                  ),
                );
              },
            )).toList(),
            const SizedBox(height: 16),
            const Text(
              "Books:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ...books.map((book) => ListTile(
              title: Text(book['title'] ?? 'Unnamed Book'),
              onTap: () {
                launchURL(book['path']!); // Open the book link
              },
            )).toList(),
          ],
        ),
      ),
    );
  }
}

// YouTube Video Player Screen
class YouTubeVideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String videoName;
  final String videoDescription;

  const YouTubeVideoPlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.videoName,
    required this.videoDescription,
  }) : super(key: key);

  @override
  _YouTubeVideoPlayerScreenState createState() =>
      _YouTubeVideoPlayerScreenState();
}

class _YouTubeVideoPlayerScreenState extends State<YouTubeVideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF674AEF),
        title: Text(widget.videoName),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.videoDescription,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isMuted = !_isMuted;
                    _controller.setVolume(_isMuted ? 0 : 100); // Mute/unmute sound
                  });
                },
                icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                label: Text(_isMuted ? 'Unmute' : 'Mute'),
              ),
              const SizedBox(width: 16), // Add spacing between buttons
              ElevatedButton.icon(
                onPressed: () {
                  _controller.seekTo(const Duration(seconds: 0)); // Restart video
                  _controller.play();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Restart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Function to launch URL for books
void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

