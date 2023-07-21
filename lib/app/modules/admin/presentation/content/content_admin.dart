import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/admin/presentation/content/content_desktop_admin.dart';
import 'package:appweb/app/modules/admin/presentation/content/content_mobile_admin.dart';
import 'package:appweb/app/modules/admin/presentation/content/content_tablet_admin.dart';

import 'package:flutter/material.dart';

class ContentAdmin extends StatelessWidget {
  const ContentAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileAdmin(),
      tablet: ContentTabletAdmin(),
      desktop: ContentDesktopAdmin(),
    );
  }
}
