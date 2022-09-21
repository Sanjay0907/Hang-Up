import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:reel_app/controller/auth/auth_controller.dart';
import 'package:reel_app/view/screens/random_number.dart';
import 'package:reel_app/view/screens/video_screen.dart';

import 'screens/home_screen/bottom_navbar_screens/add_video/add_post.dart';

// PAGES
List pages = [
  VideoScreen(),
  // Text('Search Screen'),
  RandomNumberGenerator(),
  const AddVideo(),
  const Text('Messages Screen'),
  const Text('Profile Screen'),
];

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
// var vidUploadDate = VideoUploadDate.instance;

// Random List
var totalVideos;
var randomNumbersList;
bool isLiked = false;
bool isHeartAnimating = false;
// bool vidIsPlaying = true;
bool isPlaying = true;
