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
const ktittleAppBarStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 22,
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

const kPrimaryColor = Colors.red;
const kButtonColor = Colors.black;
const kSecondaryColor = Colors.white;
const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);

const kDefaultPadding = 16.0;

Color getColor(String color) {
  switch (color) {
    case 'green':
      return Colors.green;
    case 'blue':
      return Colors.blue;
    case 'black':
      return Colors.black;
    case 'red':
      return Colors.red;
  }
  return Colors.black;
}
