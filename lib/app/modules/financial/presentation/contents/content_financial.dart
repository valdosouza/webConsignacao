import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/financial/presentation/contents/content_desktop_financial.dart';
import 'package:appweb/app/modules/financial/presentation/contents/content_mobile_financial.dart';
import 'package:appweb/app/modules/financial/presentation/contents/content_tablet_financial.dart';
import 'package:flutter/material.dart';

class ContentFinancial extends StatelessWidget {
  const ContentFinancial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileFinancial(),
      tablet: ContentTabletFinancial(),
      desktop: ContentDesktopFinancial(),
    );
  }
}
