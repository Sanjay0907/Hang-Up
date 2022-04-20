import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerHomeScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerHomeScreen({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<VideoPlayerHomeScreen> createState() => _VideoPlayerHomeScreenState();
}

class _VideoPlayerHomeScreenState extends State<VideoPlayerHomeScreen> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(color: Colors.black),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
