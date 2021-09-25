/*
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/constants.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double height;
  CustomHeader({@required this.title, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: 100.0.w,
        color: kPrimaryColor,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 8.0.w,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 20.0.sp),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 4.0.h),
                height: 20.0.h,
                alignment: Alignment.centerRight,
                child: Opacity(
                  opacity: 0.4,
                  child: Transform.rotate(
                    angle: -math.pi * 0.6 / 4,
                    child: Image.asset(
                      "assets/images/capture.png",
                      width: 35.0.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
*/