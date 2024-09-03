import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final double width = 15;

  BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AdaptiveScrollbar(
      controller: verticalScroll,
      width: width,
      position: ScrollbarPosition.right,
      child: AdaptiveScrollbar(
        underSpacing: EdgeInsets.only(bottom: width),
        controller: horizontalScroll,
        width: width,
        position: ScrollbarPosition.bottom,
        child: SingleChildScrollView(
          controller: horizontalScroll,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 800, //size.height,
            width: size.width,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: width),
              controller: verticalScroll,
              itemCount: 100,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 30,
                  child: Text("Line $index"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
