import 'package:flutter/material.dart';

Widget headerfield(String description) {
  return Container(
    height: 40,
    alignment: Alignment.center,
    margin: const EdgeInsets.all(2.0),
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
