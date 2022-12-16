import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/repository/order_stock_transfer_register_repository_impl.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/datasource/order_stock_transfer_register_datasource.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/pages/stock_transfer_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/bloc/order_stock_transfer_register_bloc.dart';

class OrderStockTransferRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderStockTransferRegisterDataSource>(
          (i) => OrderStockTransferRegisterDataSourceImpl(),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterRepositoryImpl(
              datasource: i.get<OrderStockTransferRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterGet(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderStockTransferRegisterGetList(
              repository: i.get<OrderStockTransferRegisterRepositoryImpl>()),
        ),
        Bind.singleton(
          (i) => OrderStockTransferRegisterBloc(
            getlistOrderStock: i.get<OrderStockTransferRegisterGetList>(),
            getOrderStock: i.get<OrderStockTransferRegisterGet>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderStockTransferRegisterPage(),
    ),
  ];
}
