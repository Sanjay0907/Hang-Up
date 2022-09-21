import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 80.w,
        ),
      ),
    );
  }
}
