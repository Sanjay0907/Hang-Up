import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:reel_app/utils/theme.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/auth/login.dart';
import 'package:reel_app/view/widgets/text_input_field.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 25.h,
                width: 25.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          shape: BoxShape.circle,
                          // color: Colors.black,
                          border: Border.all(color: Colors.grey, width: 2),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/hang_up.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                        height: 25.h,
                        width: 25.h,
                        child: null,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey, width: 2),
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            // size: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text(
                'Register and Hang',
                style: authText,
              ),
              SizedBox(
                height: 5.h,
              ),
              // SizedBox(
              //   height: 2.h,
              // ),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: TextInputField(
                  controller: _usernameController,
                  lableText: 'Username',
                  isObscure: false,
                  iconData: Icons.person,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: TextInputField(
                  controller: _emailController,
                  lableText: 'Email',
                  isObscure: false,
                  iconData: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: TextInputField(
                  controller: _passwordController,
                  lableText: 'Password',
                  isObscure: true,
                  iconData: Icons.lock,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  authController.registerUser(_usernameController.text,
                      _emailController.text, _passwordController.text);
                },
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/lets_hang2.png',
                          ),
                          fit: BoxFit.fitWidth),
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Have an account?',
                        style: bodySmall.copyWith(color: Colors.grey)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login())),
                        text: '\t\tHang',
                        style: bodySmall.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
