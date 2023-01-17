import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/datasource/order_stock_transfer_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/repository/order_stock_transfer_register_repository_impl.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_delete.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_main_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_post.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_put.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/page/order_stock_transfer_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class OrderStockTransferRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderStockTransferRegisterDataSource>(
          (i) => OrderStockTransferRegisterDataSourceImpl(
            httpClient: http.Client(),
          ),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterRepositoryImpl(
              datasource: i.get<OrderStockTransferRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferMainGet(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterGetlist(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterPost(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterPut(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterDelete(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductGetlist(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => EntitiesListGetlist(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.singleton((i) => OrderStockTransferRegisterBloc(
            getOrderStockTransfer: i.get<OrderStockTransferMainGet>(),
            getlistOrderStockTransfer:
                i.get<OrderStockTransferRegisterGetlist>(),
            postOrderStockTransfer: i.get<OrderStockTransferRegisterPost>(),
            putOrderStockTransfer: i.get<OrderStockTransferRegisterPut>(),
            deleteOrderStockTransfer: i.get<OrderStockTransferRegisterDelete>(),
            productGetlist: i.get<ProductGetlist>(),
            stockListGetlist: i.get<StockListGetlist>(),
            entitiesListGetlist: i.get<EntitiesListGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderStockTransferRegisterPage(),
    ),
  ];
}
