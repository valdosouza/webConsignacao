import 'package:flutter/material.dart';

Widget headerfield(BuildContext context, String description, double height) {
  final TextStyle textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.white,
        fontSize: 12,
      ) ??
      const TextStyle(
        color: Colors.white,
        fontSize: 12,
      );
  return Container(
    alignment: Alignment.center,
    height: height,
    margin: const EdgeInsets.only(left: 3.0, top: 1.0, right: 3.0, bottom: 1.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Colors.black,
    ),
    child: Text(
      description,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    ),
  );
}
