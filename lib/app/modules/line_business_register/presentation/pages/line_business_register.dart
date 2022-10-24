import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_desktop_line_business_register.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_mobile_line_business_register.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_tablet_line_business_register.dart';

import 'package:flutter/material.dart';

class LineBusinessRegister extends StatelessWidget {
  const LineBusinessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: ContentLineBusinessRegisterMobile(),
        tablet: ContentLineBusinessRegisterTablet(),
        desktop: ContentLineBusinessRegisterDesktop());
  }
}
