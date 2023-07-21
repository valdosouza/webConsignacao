import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/price_list_register/presentation/content/content_desktop_price_list_register.dart';
import 'package:appweb/app/modules/price_list_register/presentation/content/content_mobile_price_list_register.dart';
import 'package:appweb/app/modules/price_list_register/presentation/content/content_tablet_price_list_register.dart';
import 'package:flutter/material.dart';

class PriceListRegister extends StatelessWidget {
  const PriceListRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobilePriceListRegister(),
      tablet: ContentTabletPriceListRegister(),
      desktop: ContentDesktopPriceListRegister(),
    );
  }
}
