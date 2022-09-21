import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/video_screen.dart';
import 'package:reel_app/view/widgets/heart_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../controller/video_controller.dart';

class VideoPlayerHomeScreen extends StatefulWidget {
  final String videoUrl;
  final String videoid;
  const VideoPlayerHomeScreen(
      {Key? key, required this.videoUrl, required this.videoid})
      : super(key: key);

  @override
  State<VideoPlayerHomeScreen> createState() => _VideoPlayerHomeScreenState();
}

class _VideoPlayerHomeScreenState extends State<VideoPlayerHomeScreen> {
  final VideoController videoController = Get.put(VideoController());
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setPlaybackSpeed(1);
        videoPlayerController.setLooping(true);
        // videoPlayerController.
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        videoController.tapToLikeVideo(widget.videoid);
        setState(() {
          isHeartAnimating = true;
          isLiked = true;
        });
      },
      onTap: () {
// isPlaying

        isPlaying
            ? videoPlayerController.pause()
            : videoPlayerController.play();
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(color: Colors.black),
        child: VideoPlayer(videoPlayerController),
      ),
    );
  }
}
