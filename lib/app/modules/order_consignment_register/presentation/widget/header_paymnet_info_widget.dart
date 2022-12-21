import 'package:flutter/material.dart';

Widget headerPaymentInfo() {
  return Container(
    height: 35,
    alignment: Alignment.center,

    //margin: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Colors.black,
    ),
    child: const Text(
      "Total a Pagar",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
  );
}
