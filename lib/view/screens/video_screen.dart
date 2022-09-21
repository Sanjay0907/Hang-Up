import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reel_app/controller/video_controller.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/comment_screen.dart';
import 'package:reel_app/view/widgets/circle_animation.dart';
import 'package:reel_app/view/widgets/heart_animation_widget.dart';
import 'package:reel_app/view/widgets/video_player.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            // left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(
                    profilePhoto,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            itemCount: videoController.videoList.length,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 1,
            ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              // final suffledVideo = videoController[List<int>.generate(max, (i) => i + 1)..shuffle()]
              final videoData = videoController.videoList[
                  // Random().nextInt(videoController.videoList.length)
                  index];
              // isLiked = videoController.videoIsLiked(videoData.id);
              return Stack(
                children: [
                  VideoPlayerHomeScreen(
                    videoUrl: videoData.videoUrl,
                    videoid: videoData.id,
                    // uid: videoData.uid,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    videoData.username,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    videoData.caption,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        videoData.songName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(
                                top: 30.h,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildProfile(videoData.profilePhoto),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          videoController
                                              .likeVideo(videoData.id);
                                        },
                                        child: Icon(Icons.favorite,
                                            size: 40,
                                            color: videoData.likes.contains(
                                                    authController.user.uid)
                                                ? Colors.red
                                                : Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        videoData.likes.length.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Navigator.restorablePush(context, (context, arguments) => null)
// Navigator.restorableReplace(context, oldRoute: (context,), newRouteBuilder: (context,))
                                          // videoController.dispose();
                                          // VideoPlayerController videoPlayerController = ;
                                          // videoPlayerController.dispose();
                                          // VideoScreen videoScreen;
                                          // VideoPlayerHomeScreen
                                          //     videoPlayerHomeScreen;
                                          // videoPlayerHomeScreen.
                                          // VideoPlayerController videoPlayerController;
                                          // videoPlayerController.
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentScreen()));
                                        },
                                        child: const Icon(
                                          Icons.comment,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        videoData.commentCount.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.reply,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        videoData.shareCount.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CircleAnimation(
                                      child: buildMusicAlbum(
                                    videoData.profilePhoto,
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: isHeartAnimating ? 1 : 0,
                      child: HeartAnimationWidget(
                        // duration: const Duration(milliseconds: 700),
                        isAnimating: isHeartAnimating,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 100,
                        ),
                        onEnd: () => setState(() => isHeartAnimating = false),
                      ),
                    ),
                  ),
                ],
              );
            });
      }),
    );
  }
}
