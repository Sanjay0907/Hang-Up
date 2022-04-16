import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:reel_app/controller/auth/auth_controller.dart';
import 'package:reel_app/view/screens/add_video/add_post.dart';

// PAGES
const pages = [
  Text('Home Screen'),
  Text('Search Screen'),
  AddVideo(),
  Text('Messages Screen'),
  Text('Profile Screen'),
];

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
