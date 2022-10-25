import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_desktop_line_business.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_mobile_line_business.dart';

import 'package:flutter/material.dart';

class LineBusinessRegister extends StatelessWidget {
  const LineBusinessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileLinebusiness(),
      tablet: ContentMobileLinebusiness(),
      desktop: ContentDesktopLineBusiness(),
    );
  }
}
