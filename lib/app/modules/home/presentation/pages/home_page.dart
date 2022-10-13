import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/home/presentation/pages/home_page_desktop.dart';
import 'package:appweb/app/modules/home/presentation/pages/home_page_mobile.dart';
import 'package:appweb/app/modules/home/presentation/pages/home_page_tablet.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomePageMobile(),
      tablet: HomePageTablet(),
      desktop: HomePageDesktop(),
    );
  }
}
