import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reel_app/controller/auth/auth_controller.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:reel_app/view/screens/auth/login.dart';
import 'package:reel_app/view/screens/date_time.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const ReelApp());
}

class ReelApp extends StatelessWidget {
  const ReelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: backgroundColor),
          home: Login(),
        );
      },
    );
  }
}
