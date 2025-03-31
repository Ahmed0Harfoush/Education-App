import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoSection extends StatefulWidget {
  final String youtubeUrl;

  YouTubeVideoSection({required this.youtubeUrl});

  @override
  _YouTubeVideoSectionState createState() => _YouTubeVideoSectionState();
}

class _YouTubeVideoSectionState extends State<YouTubeVideoSection> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.youtubeUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}























// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class YouTubeVideoSection extends StatefulWidget {
//   final String youtubeUrl;
//
//   YouTubeVideoSection({required this.youtubeUrl});
//
//   @override
//   _YouTubeVideoSectionState createState() => _YouTubeVideoSectionState();
// }
//
// class _YouTubeVideoSectionState extends State<YouTubeVideoSection> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.youtubeUrl);
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
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
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return AspectRatio(
//             aspectRatio: 16 / 9,
//             child: VideoPlayer(_controller),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }


