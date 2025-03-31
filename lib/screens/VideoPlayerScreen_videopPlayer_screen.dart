import 'package:flutter/material.dart';
import '../widgets/youtube_video_section.dart';
import '../widgets/videos_section.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;
  final String videoTitle;

  VideoPlayerPage({required this.videoUrl, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(videoTitle),
      ),
      body: Center(
        child: videoUrl.contains('youtube.com') || videoUrl.contains('youtu.be')
            ? YouTubeVideoSection(youtubeUrl: videoUrl)
            : VideoItem(videoUrl: videoUrl),
      ),
    );
  }
}
