import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? email;
  String? uid;
  String? profilePhoto;

  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "uid": uid, "profilePhoto": profilePhoto};

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      name: snapshot['name'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      profilePhoto: snapshot['profilePhoto'],
    );
  }
}
