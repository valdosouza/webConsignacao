import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_production/presentation/content/content_order_production_desktop.dart';
import 'package:appweb/app/modules/order_production/presentation/content/content_order_production_mobile.dart';
import 'package:appweb/app/modules/order_production/presentation/content/content_order_production_tablet.dart';

import 'package:flutter/material.dart';

class ContentOrderProduction extends StatelessWidget {
  const ContentOrderProduction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentOrderProductionMobile(),
      tablet: ContentOrderProductionTablet(),
      desktop: ContentOrderProductionDesktop(),
    );
  }
}
