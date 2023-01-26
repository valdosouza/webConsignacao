import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_bonus_register/data/datasource/order_bonus_register_datasource.dart';
import 'package:appweb/app/modules/order_bonus_register/data/repository/order_bonus_register_repository_impl.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_closure.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_delete.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_get.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_get_list.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_post.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_put.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_reopen.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/page/order_bonus_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class OrderBonusRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.factory<OrderBonusRegisterDataSource>(
          (i) => OrderBonusRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterRepositoryImpl(
              datasource: i.get<OrderBonusRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterGet(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterGetlist(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterPost(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterPut(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterDelete(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterClosure(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderBonusRegisterReopen(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => ProductGetlist(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => StockListGetlist(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => EntitiesListGetlist(
              repository: i.get<OrderBonusRegisterRepositoryImpl>()),
        ),
        Bind.singleton((i) => OrderBonusRegisterBloc(
            getOrderBonus: i.get<OrderBonusRegisterGet>(),
            getlistOrderBonus: i.get<OrderBonusRegisterGetlist>(),
            postOrderBonus: i.get<OrderBonusRegisterPost>(),
            putOrderBonus: i.get<OrderBonusRegisterPut>(),
            deleteOrderBonus: i.get<OrderBonusRegisterDelete>(),
            closureOrderBonus: i.get<OrderBonusRegisterClosure>(),
            reopenOrderBonus: i.get<OrderBonusRegisterReopen>(),
            productGetlist: i.get<ProductGetlist>(),
            stockListGetlist: i.get<StockListGetlist>(),
            entitiesListGetlist: i.get<EntitiesListGetlist>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderBonusRegisterPage(),
    ),
  ];
}
