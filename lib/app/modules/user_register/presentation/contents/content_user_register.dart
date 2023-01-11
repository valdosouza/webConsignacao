import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/user_register/presentation/contents/content_desktop_user_register.dart';
import 'package:appweb/app/modules/user_register/presentation/contents/content_mobile_user_register.dart';
import 'package:appweb/app/modules/user_register/presentation/contents/content_tablet_user_register.dart';

import 'package:flutter/material.dart';

class ContentUserRegister extends StatelessWidget {
  const ContentUserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileUserRegister(),
      tablet: ContentTabletUserRegister(),
      desktop: ContentDesktopUserRegister(),
    );
  }
}
