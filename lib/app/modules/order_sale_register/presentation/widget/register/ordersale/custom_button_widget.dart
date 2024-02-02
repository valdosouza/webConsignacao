import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

Widget custombutton(String buttonName, Function() function) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
    child: ElevatedButton(
      style: kElevatedButtonStyleRed,
      onPressed: () {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        margin:
            const EdgeInsets.only(left: 2.0, top: 0.0, right: 2.0, bottom: 0.0),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Text(
          buttonName,
          style: kElevatedButtonTextStyle,
        ),
      ),
    ),
  );
}
