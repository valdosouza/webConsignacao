import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_desktop_linebusiness.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_mobile_linebusiness.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_tablet_linebusiness.dart';
import 'package:flutter/material.dart';

class LinebusinessRegister extends StatelessWidget {
  const LinebusinessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileLinebusiness(),
      tablet: ContentTabletLinebusiness(),
      desktop: ContentDesktopLinebusiness(),
    );
  }
}
