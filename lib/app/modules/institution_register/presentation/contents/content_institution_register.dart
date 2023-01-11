import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/institution_register/presentation/contents/content_desktop_institution_register.dart';
import 'package:appweb/app/modules/institution_register/presentation/contents/content_mobile_institution_register.dart';
import 'package:appweb/app/modules/institution_register/presentation/contents/content_tablet_institution_register.dart';

import 'package:flutter/material.dart';

class ContentInstitution extends StatelessWidget {
  const ContentInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileInstitutionRegister(),
      tablet: ContentTabletInstitutionRegister(),
      desktop: ContentDesktopInstitutionRegister(),
    );
  }
}
