import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_desktop_linebusiness.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_mobile_linebusiness.dart';
import 'package:appweb/app/modules/line_business_register/presentation/content/content_tablet_linebusiness.dart';
import 'package:flutter/cupertino.dart';

class LinebusinessRegister extends StatefulWidget {
  const LinebusinessRegister({super.key});

  @override
  State<LinebusinessRegister> createState() => _LinebusinessRegisterState();
}

class _LinebusinessRegisterState extends State<LinebusinessRegister> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileLinebusinessRegister(),
      tablet: ContentTabletLinebusinessRegister(),
      desktop: ContentDesktopLinebusinessRegister(),
    );
  }
}
