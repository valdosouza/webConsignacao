// ignore: must_be_immutable
import 'package:flutter/material.dart';

Widget itemMenuDraw(IconData icon, String text, Function ontap) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: InkWell(
          onTap: () async {
            ontap.call();
          },
          splashColor: Colors.orangeAccent,
          child: SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Icon(icon),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 16.0),
                    ))
              ],
            ),
          )),
    ),
  );
}
