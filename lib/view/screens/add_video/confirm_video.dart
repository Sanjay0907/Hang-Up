import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_app/controller/upload_video/upload_video_controller.dart';
import 'package:reel_app/model/upload_date.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/widgets/text_input_field.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class ConfirmAndPost extends StatefulWidget {
  final File videoFile;

  final String videoPath;
  const ConfirmAndPost({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmAndPost> createState() => _ConfirmAndPostState();
}

class _ConfirmAndPostState extends State<ConfirmAndPost> {
  bool isplaying = true;
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  UploadVideo uploadVideoController = Get.put(UploadVideo());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                isplaying ? controller.pause() : controller.play();
                setState(() {
                  isplaying = !isplaying;
                });
              },
              child: SizedBox(
                width: 100.w,
                height: 70.h,
                child: VideoPlayer(controller),
              ),
            ),
            const SizedBox(
              height: 30,
              // child:
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: TextInputField(
                        lableText: 'Song Name',
                        isObscure: false,
                        iconData: Icons.music_note,
                        controller: _songController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: TextInputField(
                        lableText: 'Caption',
                        isObscure: false,
                        iconData: Icons.closed_caption,
                        controller: _captionController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          VideoUploadDate videoUploadDate = VideoUploadDate();
                          videoUploadDate.uploadDate(
                            DateTime.now().year.toString(),
                            DateTime.now().month.toString(),
                            DateTime.now().day.toString(),
                            DateTime.now().hour.toString(),
                            DateTime.now().second.toString(),
                            DateTime.now().minute.toString(),
                            DateTime.now().weekday.toString(),
                          );

                          uploadVideoController.uploadVideo(
                            _songController.text,
                            _captionController.text,
                            widget.videoPath,
                            videoUploadDate.upload_date.toString(),
                            DateTime.now().year.toString(),
                            DateTime.now().month.toString(),
                            DateTime.now().day.toString(),
                            DateTime.now().hour.toString(),
                            DateTime.now().second.toString(),
                            DateTime.now().minute.toString(),
                            videoUploadDate.week_day.toString(),
                          );
                          print('Complete Date : ' +
                              videoUploadDate.upload_date.toString());
                          print('weekDay : ' +
                              videoUploadDate.week_day.toString());
                        },
                        child: const Text(
                          'Share!',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
