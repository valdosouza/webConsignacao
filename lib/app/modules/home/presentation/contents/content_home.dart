import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/home/presentation/contents/content_desktop_home.dart';
import 'package:appweb/app/modules/home/presentation/contents/content_mobile_home.dart';
import 'package:appweb/app/modules/home/presentation/contents/content_tablet_home.dart';

import 'package:flutter/material.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileHome(),
      tablet: ContentTabletHome(),
      desktop: ContentDesktopHome(),
    );
  }
}
