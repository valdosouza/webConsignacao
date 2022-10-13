import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/user_register/presentation/content/content_desktop_user_register.dart';
import 'package:appweb/app/modules/user_register/presentation/content/content_mobile_user_register.dart';
import 'package:appweb/app/modules/user_register/presentation/content/content_tablet_user_register.dart';

import 'package:flutter/material.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileUserRegister(),
      tablet: ContentTabletUserRegister(),
      desktop: ContentDesktopUserRegister(),
    );
  }
}
