import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/product/presentation/content/content_desktop_product.dart';
import 'package:appweb/app/modules/product/presentation/content/content_mobile_product.dart';
import 'package:appweb/app/modules/product/presentation/content/content_tablet_product.dart';

import 'package:flutter/material.dart';

class ContentProduct extends StatelessWidget {
  const ContentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileProduct(),
      tablet: ContentTabletProduct(),
      desktop: ContentDesktopProduct(),
    );
  }
}
