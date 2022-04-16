// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:reel_app/utils/colors.dart';

class TextInputField extends StatelessWidget {
  // const TextInputField({ Key? key }) : super(key: key);

  TextInputField(
      {Key? key,
      required this.lableText,
      required this.isObscure,
      required this.iconData,
      required this.controller,
      required this.keyboardType})
      : super(key: key);

  TextEditingController controller;
  String lableText = '';
  bool isObscure = false;
  final IconData iconData;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      // keyboardType: TextInputType.emailAddress,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: Icon(iconData),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
