import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page_desktop.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page_mobile.dart';
import 'package:appweb/app/modules/admin/presentation/pages/admin_page_tablet.dart';

import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: AdminPageMobile(),
      tablet: AdminPageTablet(),
      desktop: AdminPageDesktop(),
    );
  }
}
