import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:reel_app/model/user.dart' as model;
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/auth/login.dart';
import 'package:reel_app/view/screens/home_screen/home_screen.dart';

class AuthController extends GetxController {
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  static AuthController instance = Get.find();
// Upload User-Profile-Image to FireBase Storage
  Future<String> _uploadUserProfileImage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ProfilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

// Register for new User
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // Save user data for Authentication and Firebase Firestore
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadUserProfileImage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: userCredential.user!.uid,
          profilePhoto: downloadUrl,
        );

        await fireStore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error', 'Please Enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      // print(e.toString());
    }
  }

//   void userProfilePic(File? profileImage) async {
//     try {
//       if (profileImage != null) {
// // Upload UserProfileImage to Firestore Database
//         String downloadUrl = await _uploadUserProfileImage(profileImage);
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//   }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar(
          'Logg in Successful',
          '',
        );
      } else {
        Get.snackbar('Error Logging in', 'Please Enter all the Fields');
      }
    } catch (e) {
      Get.snackbar('Oops!', 'Invalid Credentials');
    }
  }

  void pickImage() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      Get.snackbar(
        'Profile Picture',
        'Profile Pic selected sucessfully',
      );
    }
    _pickedImage = Rx<File?>(File(pickImage!.path));
  }
}
