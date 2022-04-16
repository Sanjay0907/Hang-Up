import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:reel_app/view/screens/add_video/confirm_video.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfirmAndPost(
                videoFile: File(video.path),
                videoPath: video.path,
              )));
    }
  }

  showOptionsDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: Row(
                    children: const [
                      Icon(Icons.image),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Gallery',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Camera',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Row(
                    children: const [
                      Icon(Icons.cancel),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Cancle',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showOptionsDialogue(context);
          },
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
