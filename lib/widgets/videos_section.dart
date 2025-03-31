import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosSection extends StatelessWidget {
  final List<String> videos;

  VideosSection({required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoItem(videoUrl: videos[index]);
      },
    );
  }
}

class VideoItem extends StatefulWidget {
  final String videoUrl;

  VideoItem({required this.videoUrl});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Auto play video
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(height: 200, child: Center(child: CircularProgressIndicator())),
        VideoControls(controller: _controller),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;

  VideoControls({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}

