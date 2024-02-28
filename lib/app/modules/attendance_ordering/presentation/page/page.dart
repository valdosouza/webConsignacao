import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/desktop.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/mobile.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/page/tablet.dart';
import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: Mobile(),
      tablet: Tablet(),
      desktop: Desktop(),
    );
  }
}
