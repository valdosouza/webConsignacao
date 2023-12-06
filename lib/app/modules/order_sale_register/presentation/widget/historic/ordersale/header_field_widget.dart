import 'package:flutter/material.dart';

Widget headerfield(String description) {
  return Container(
    alignment: Alignment.center,
    height: 35,
    margin: const EdgeInsets.only(left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Colors.black,
    ),
    child: Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
