import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:reel_app/utils/theme.dart';
import 'package:reel_app/view/constants.dart';
import 'package:reel_app/view/screens/auth/signup.dart';
import 'package:reel_app/view/widgets/text_input_field.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: ,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 30.h,
                width: 30.h,
                child:
                    const Image(image: AssetImage('assets/images/hang_up.png')),
              ),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                'Login',
                style: authText,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 10.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                // color: Colors.amber,
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
                height: 10.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                // color: Colors.amber,
                child: TextInputField(
                  controller: _passwordController,
                  lableText: 'Password',
                  isObscure: true,
                  iconData: Icons.lock,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  authController.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
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
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Can\'t Hang?',
                    style: bodySmall.copyWith(color: Colors.grey)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup())),
                    text: '\t\tRegister',
                    style: bodySmall.copyWith(fontWeight: FontWeight.w700))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
