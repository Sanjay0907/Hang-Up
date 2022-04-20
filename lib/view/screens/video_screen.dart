import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reel_app/controller/video_controller.dart';
import 'package:reel_app/view/widgets/circle_animation.dart';
import 'package:reel_app/view/widgets/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(1),
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
      body: PageView.builder(
          itemCount: 5,
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // VideoPlayerHomeScreen(videoUrl: videoUrl),
                Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'username',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'caption',
                                  style: TextStyle(
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
                                      'song name',
                                      style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildProfile('string url'),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '2200',
                                      style: TextStyle(
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
                                      child: Icon(
                                        Icons.comment,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '2',
                                      style: TextStyle(
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
                                      child: Icon(
                                        Icons.reply,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '2200',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAnimation(
                                    child: buildMusicAlbum(
                                  'profilePhoto',
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
