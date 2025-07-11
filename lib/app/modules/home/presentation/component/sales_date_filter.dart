import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

Widget salesDateFilter(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(kDefaultPadding),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: kPrimaryColor.withValues(alpha: 0.15),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(kDefaultPadding),
      ),
    ),
    child: const Row(
      children: [
        Expanded(
          child: Text("Data: 01/04/2020"),
        ),
      ],
    ),
  );
}
