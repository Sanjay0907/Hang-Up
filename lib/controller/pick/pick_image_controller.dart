import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Pick {
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  void PickImage() async {
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
