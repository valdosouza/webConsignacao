import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/datasource/order_stock_adjustment_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/repository/order_stock_adjustment_register_repository_impl.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_closure.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_delete.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_main_get.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_post.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_put.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_reopen.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/page/order_stock_adjustment_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class OrderStockAdjustmentRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderStockAdjustmentRegisterDataSource>(
          (i) => OrderStockAdjustmentRegisterDataSourceImpl(
            httpClient: http.Client(),
          ),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterRepositoryImpl(
              datasource: i.get<OrderStockAdjustmentRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentMainGet(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterGetlist(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterPost(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterPut(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterDelete(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterClosure(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterReopen(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductGetlist(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => EntitiesListGetlist(
              repository: i.get<OrderStockAdjustmentRegisterRepositoryImpl>()),
        ),
        Bind.singleton((i) => OrderStockAdjustmentRegisterBloc(
            getOrderStockAdjustment: i.get<OrderStockAdjustmentMainGet>(),
            getlistOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterGetlist>(),
            postOrderStockAdjustment: i.get<OrderStockAdjustmentRegisterPost>(),
            putOrderStockAdjustment: i.get<OrderStockAdjustmentRegisterPut>(),
            deleteOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterDelete>(),
            closureOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterClosure>(),
            reopenOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterReopen>(),
            productGetlist: i.get<ProductGetlist>(),
            stockListGetlist: i.get<StockListGetlist>(),
            entitiesListGetlist: i.get<EntitiesListGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderStockAdjustmentRegisterPage(),
    ),
  ];
}
