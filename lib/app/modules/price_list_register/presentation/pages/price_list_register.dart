import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/price_list_register/presentation/contents/content_desktop_price_list_register.dart';
import 'package:appweb/app/modules/price_list_register/presentation/contents/content_mobile_price_list_register.dart';
import 'package:appweb/app/modules/price_list_register/presentation/contents/content_tablet_price_list_register.dart';
import 'package:flutter/material.dart';

class ContentPriceListRegister extends StatelessWidget {
  const ContentPriceListRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobilePriceListRegister(),
      tablet: ContentTabletPriceListRegister(),
      desktop: ContentDesktopPriceListRegister(),
    );
  }
}
