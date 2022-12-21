import 'package:flutter/material.dart';

Widget fieldedit(String description, bool enabled) {
  return Container(
    height: 40,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 3.0, top: 0.0, right: 3.0, bottom: 0.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: TextField(
      enabled: enabled,
      controller: TextEditingController(
        text: (description),
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onSubmitted: (value) {},
    ),
  );
}
