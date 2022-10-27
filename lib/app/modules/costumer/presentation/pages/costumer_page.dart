import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/costumer/presentation/pages/costumer_page_desktop.dart';
import 'package:appweb/app/modules/costumer/presentation/pages/costumer_page_mobile.dart';
import 'package:appweb/app/modules/costumer/presentation/pages/costumer_page_tablet.dart';
import 'package:flutter/material.dart';

class CostumerPage extends StatelessWidget {
  const CostumerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CostumerPageMobile(),
      tablet: CostumerPageTablet(),
      desktop: CostumerPageDesktop(),
    );
  }
}
