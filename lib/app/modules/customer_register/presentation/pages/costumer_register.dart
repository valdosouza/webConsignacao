import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_desktop_costumer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_mobile_costumer_register.dart';
import 'package:appweb/app/modules/customer_register/presentation/contents/content_tablet_costumer_register.dart';
import 'package:flutter/material.dart';

class ContentCostumerRegister extends StatelessWidget {
  const ContentCostumerRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileCostumerRegister(),
      tablet: ContentTabletCostumerRegister(),
      desktop: ContentDesktopCostumerRegister(),
    );
  }
}
