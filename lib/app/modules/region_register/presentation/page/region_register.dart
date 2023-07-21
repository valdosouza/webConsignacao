import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/region_register/presentation/content/content_desktop_region_register.dart';
import 'package:appweb/app/modules/region_register/presentation/content/content_mobile_region_register.dart';
import 'package:appweb/app/modules/region_register/presentation/content/content_tablet_region_register.dart';
import 'package:flutter/material.dart';

class RegionRegister extends StatelessWidget {
  const RegionRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileRegionRegister(),
      tablet: ContentTabletRegionRegister(),
      desktop: ContentDesktopRegionRegister(),
    );
  }
}
