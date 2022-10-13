import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page_desktop.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page_mobile.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page_tablet.dart';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ProductPAgeMobile(),
      tablet: ProductPageTablet(),
      desktop: ProductPageDesktop(),
    );
  }
}
