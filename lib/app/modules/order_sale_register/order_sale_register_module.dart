import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_sale_register/data/datasource/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/repository/order_sale_register_repository_impl.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_closure.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_delete.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_main_get.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_get_list.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_post.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_put.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_reopen.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/order_sale_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class OrderSaleRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderSaleRegisterDataSource>(
          (i) => OrderSaleRegisterDataSourceImpl(
            httpClient: http.Client(),
          ),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterRepositoryImpl(
              datasource: i.get<OrderSaleRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderSaleMainGet(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterGetlist(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterPost(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterPut(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterDelete(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterClosure(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterReopen(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductGetlist(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => EntitiesListGetlist(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.singleton((i) => OrderSaleRegisterBloc(
            getOrderSale: i.get<OrderSaleMainGet>(),
            getlistOrderSale: i.get<OrderSaleRegisterGetlist>(),
            postOrderSale: i.get<OrderSaleRegisterPost>(),
            putOrderSale: i.get<OrderSaleRegisterPut>(),
            deleteOrderSale: i.get<OrderSaleRegisterDelete>(),
            closureOrderStocktransfer: i.get<OrderSaleRegisterClosure>(),
            reopenOrderStocktransfer: i.get<OrderSaleRegisterReopen>(),
            productGetlist: i.get<ProductGetlist>(),
            stockListGetlist: i.get<StockListGetlist>(),
            entitiesListGetlist: i.get<EntitiesListGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderSaleRegisterPage(),
    ),
  ];
}
