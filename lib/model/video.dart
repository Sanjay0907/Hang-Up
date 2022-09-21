import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  // Video upload details
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  // Video Upload Date
  String year;
  String month;
  String day;
  String hour;
  String second;
  String minute;
  String weekday;
  String uploadDate;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
    required this.weekday,
    required this.uploadDate,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": caption,
        "videoURL": videoUrl,
        "thumbnail": thumbnail,
        "profilePhoto": profilePhoto,
        "Year": year,
        "Month": month,
        "Day": day,
        "Hour": hour,
        "Minute": minute,
        "Seconds": second,
        "WeekDay": weekday,
        "UploadDate": uploadDate
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
      uploadDate: snapshot['UploadDate'],
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      songName: snapshot['songName'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoURL'],
      thumbnail: snapshot['thumbnail'],
      profilePhoto: snapshot['profilePhoto'],
      year: snapshot['Year'],
      month: snapshot['Month'],
      day: snapshot['Day'],
      hour: snapshot['Hour'],
      minute: snapshot['Minute'],
      second: snapshot['Seconds'],
      weekday: snapshot['WeekDay'],
    );
  }
}
