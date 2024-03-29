import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_production_register/data/datasource/order_production_register_datasource.dart';
import 'package:appweb/app/modules/order_production_register/data/repository/product_register_repository_impl.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_closure.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_delete.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_post.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_put.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_reopen.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/page/order_production_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class OrderProductionRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderProductionRegisterDataSource>(
          (i) =>
              OrderProductionRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterRepositoryImpl(
              datasource: i.get<OrderProductionRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterGet(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterGetlist(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterPost(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterPut(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterDelete(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterClosure(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterReopen(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductGetlist(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        Bind.singleton((i) => OrderProductionRegisterBloc(
            getOrderProduction: i.get<OrderProductionRegisterGet>(),
            getlistOrderProduction: i.get<OrderProductionRegisterGetlist>(),
            postOrderProduction: i.get<OrderProductionRegisterPost>(),
            putOrderProduction: i.get<OrderProductionRegisterPut>(),
            deleteOrderProduction: i.get<OrderProductionRegisterDelete>(),
            closureOrderProduction: i.get<OrderProductionRegisterClosure>(),
            reopenOrderProduction: i.get<OrderProductionRegisterReopen>(),
            productGetlist: i.get<ProductGetlist>(),
            stockListGetlist: i.get<StockListGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderProductionRegisterPage(),
    ),
  ];
}
