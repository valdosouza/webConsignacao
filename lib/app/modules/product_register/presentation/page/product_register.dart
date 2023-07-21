import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/product_register/presentation/content/content_desktop_product_register.dart';
import 'package:appweb/app/modules/product_register/presentation/content/content_mobile_product_register.dart';
import 'package:appweb/app/modules/product_register/presentation/content/content_tablet_product_register.dart';
import 'package:flutter/material.dart';

class ProductRegister extends StatelessWidget {
  const ProductRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobileProductRegister(),
      tablet: ContentTabletProductRegister(),
      desktop: ContentDesktopProductRegister(),
    );
  }
}
