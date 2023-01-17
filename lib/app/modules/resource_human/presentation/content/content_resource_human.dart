import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/resource_human/presentation/content/content_desktop_resource_human.dart';
import 'package:appweb/app/modules/resource_human/presentation/content/content_mobile_financial.dart';
import 'package:appweb/app/modules/resource_human/presentation/content/content_tablet_resource_human.dart';
import 'package:flutter/material.dart';

class ContentResourceHuman extends StatelessWidget {
  const ContentResourceHuman({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileResourceHuman(),
      tablet: ContentTabletResourceHuman(),
      desktop: ContentDesktopResourceHuman(),
    );
  }
}
