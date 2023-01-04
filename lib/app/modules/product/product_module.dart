import 'package:appweb/app/modules/price_list_register/price_list_register_module.dart';
import 'package:appweb/app/modules/product/data/datasource/product_datasource.dart';
import 'package:appweb/app/modules/product/data/repository/product_repository_impl.dart';
import 'package:appweb/app/modules/product/domain/usecase/product_getlist_prices.dart';
import 'package:appweb/app/modules/product/presentation/bloc/product_bloc.dart';
import 'package:appweb/app/modules/product/presentation/pages/product_page.dart';
import 'package:appweb/app/modules/product_register/product_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ProductModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<ProductDataSource>(
          (i) => ProductDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => ProductRepositoryImpl(datasource: i.get<ProductDataSource>()),
        ),
        Bind.factory(
          (i) => PricesListGet(repository: i.get<ProductRepositoryImpl>()),
        ),
        Bind.singleton((i) => ProductBloc(
              getPriceList: i.get<PricesListGet>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const ProductPage(),
      children: [
        ModuleRoute('/listpricetable/', module: PriceListRegisterModule()),
        ModuleRoute('/listproduct/', module: ProductRegisterModule())
      ],
    ),
  ];
}
