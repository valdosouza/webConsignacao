import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast(String title) {
    Fluttertoast.showToast(
        msg: title,
        timeInSecForIosWeb: 3,
        webShowClose: true,
        webPosition: "center",
        backgroundColor: const Color.fromARGB(255, 229, 57, 57),
        webBgColor: "linear-gradient(to right, #ff0000, #ff0000)",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16.0);
  }
}
