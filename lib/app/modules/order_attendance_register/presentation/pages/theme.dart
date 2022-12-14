import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const kBoxDecorationStyle = BoxDecoration(
  color: Colors.black12,
  //borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kBoxDecorationflexibleSpace = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 241, 97, 97),
        Color.fromARGB(255, 224, 71, 71),
        Color.fromARGB(255, 229, 57, 57),
      ]),
);

const kPrimaryColor = Color.fromARGB(255, 255, 0, 0);
const kSecondaryColor = Color(0xFFF5F6FC);
const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);

const kDefaultPadding = 16.0;
