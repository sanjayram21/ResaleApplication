/*
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isObscured;

  CustomTextField({@required this.hint, this.isObscured = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0.h),
      child: TextField(
        obscureText: isObscured,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kButtonPrimaryColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
*/