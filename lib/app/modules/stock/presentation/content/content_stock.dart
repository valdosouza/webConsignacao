import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_desktop_stock.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_mobile_stock.dart';
import 'package:appweb/app/modules/stock/presentation/content/content_tablet_stock.dart';

import 'package:flutter/material.dart';

class ContentStock extends StatelessWidget {
  const ContentStock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileStock(),
      tablet: ContentTabletStock(),
      desktop: ContentDesktopStock(),
    );
  }
}
