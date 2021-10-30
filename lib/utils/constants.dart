import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff55D7BC);
const kSecondaryColor = Color(0xffF5F7F9);

const kButtonPrimaryColor = Color(0xff56A4D7);

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;


Decoration boxDecoration(color) {
  return BoxDecoration(
      color: color,
      borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(40.0),
        topRight: const Radius.circular(40.0),
      ));
}
