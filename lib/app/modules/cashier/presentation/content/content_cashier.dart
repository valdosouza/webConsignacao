import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/cashier/presentation/content/content_desktop_cashier.dart';
import 'package:appweb/app/modules/cashier/presentation/content/content_mobile_cashier.dart';
import 'package:appweb/app/modules/cashier/presentation/content/content_tablet_cashier.dart';

import 'package:flutter/material.dart';

class ContentCashier extends StatelessWidget {
  const ContentCashier({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCashier(),
      tablet: ContentTabletCashier(),
      desktop: ContentDesktopCashier(),
    );
  }
}
