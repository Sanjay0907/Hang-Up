import 'package:flutter/material.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:reel_app/view/screens/auth/login.dart';
import 'package:reel_app/view/screens/auth/signup.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const ReelApp());
}

class ReelApp extends StatelessWidget {
  const ReelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: backgroundColor),
          home: Signup(),
        );
      },
    );
  }
}
