import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/costumer/contents/content_desktop_costumer.dart';
import 'package:appweb/app/modules/costumer/contents/content_mobile__costumer.dart';
import 'package:appweb/app/modules/costumer/contents/content_tablet_costumer.dart';
import 'package:flutter/material.dart';

class ContentCostumer extends StatelessWidget {
  const ContentCostumer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCostumer(),
      tablet: ContentTabletCostumer(),
      desktop: ContentDesktopCostumer(),
    );
  }
}
