import 'package:flutter/material.dart';

Widget fieldedit(String description, bool enabled) {
  return Container(
    alignment: Alignment.centerRight,
    height: 35,
    margin: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: TextField(
      enabled: enabled,
      controller: TextEditingController(
        text: (description),
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
      onSubmitted: (value) {},
    ),
  );
}
