import 'package:flutter/material.dart';

Widget degradeArea() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 241, 97, 97),
          Color.fromARGB(255, 224, 71, 71),
          Color.fromARGB(255, 229, 57, 57),
        ],
        //stops: [0.1, 0.4, 0.7, 0.9],
      ),
    ),
  );
}
