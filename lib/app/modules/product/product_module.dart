import 'package:appweb/app/modules/price_list_register/price_list_register_module.dart';
import 'package:appweb/app/modules/product/presentation/content/content_product.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page.dart';
import 'package:appweb/app/modules/product_register/product_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const ProductPage(),
      children: [
        ChildRoute('/content/', child: (_, args) => const ContentProduct()),
        ModuleRoute('/content/listpricetable/',
            module: PriceListRegisterModule()),
        ModuleRoute('/content/listproduct/', module: ProductRegisterModule())
      ],
    ),
  ];
}
