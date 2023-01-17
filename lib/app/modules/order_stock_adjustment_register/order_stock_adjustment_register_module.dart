import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/datasource/order_stock_adjustment_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/repository/order_stock_adjustment_register_repository_impl.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_delete.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_post.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_put.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/page/order_stock_adjustment_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderStockAdjustmentRegisterDataSource>(
          (i) => OrderStockAdjustmentRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterRepositoryImpl(
              datasource: i.get<OrderStockAdjustmentRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderStockAdjustmentRegisterGet(
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
            getOrderStockAdjustment: i.get<OrderStockAdjustmentRegisterGet>(),
            getlistOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterGetlist>(),
            postOrderStockAdjustment: i.get<OrderStockAdjustmentRegisterPost>(),
            putOrderStockAdjustment: i.get<OrderStockAdjustmentRegisterPut>(),
            deleteOrderStockAdjustment:
                i.get<OrderStockAdjustmentRegisterDelete>(),
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
