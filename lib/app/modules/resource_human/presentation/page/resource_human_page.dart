import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/resource_human/presentation/page/resource_human_page_desktop.dart';
import 'package:appweb/app/modules/resource_human/presentation/page/resource_human_page_mobile.dart';
import 'package:appweb/app/modules/resource_human/presentation/page/resource_human_page_tablet.dart';

import 'package:flutter/material.dart';

class ResourceHumanPage extends StatelessWidget {
  const ResourceHumanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ResourceHumanPageMobile(),
      tablet: ResourceHumanPageTablet(),
      desktop: ResourceHumanPageDesktop(),
    );
  }
}
