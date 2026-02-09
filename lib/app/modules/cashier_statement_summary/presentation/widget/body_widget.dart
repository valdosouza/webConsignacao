import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final double width = 15;

  BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double height =
            constraints.maxHeight.isFinite ? constraints.maxHeight : 300;
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
                width: constraints.maxWidth,
                height: height,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: width),
                  controller: verticalScroll,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Text("Line $index");
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
