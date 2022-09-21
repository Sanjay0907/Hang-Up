import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:reel_app/model/video.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/home_screen/home_screen.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideo extends GetxController with Bindings {
  // Video Uploaded Status
  late Future<bool> _videoUploadStatus;
  Future<bool> get videoUploadStatus => _videoUploadStatus;
  //  Upload Video

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
      // duration: 30,
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(
    String songName,
    String caption,
    String videoPath,
    String uploadDate,
    String year,
    String month,
    String day,
    String hour,
    String second,
    String minute,
    String weekday,
  ) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
      // Get ID
      var allDocs = await fireStore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        uploadDate: uploadDate,
        day: day,
        hour: hour,
        minute: minute,
        month: month,
        second: second,
        weekday: weekday,
        year: year,
      );

      await fireStore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson());

      Get.offAll(const HomeScreen());
      Get.snackbar('Video Upload Status', 'Successful');

      // Get.back();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void dependencies() {}
}
