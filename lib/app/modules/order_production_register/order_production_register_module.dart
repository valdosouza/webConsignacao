import 'package:appweb/app/modules/order_production_register/data/datasource/order_production_register_datasource.dart';
import 'package:appweb/app/modules/order_production_register/data/repository/order_production_register_repository_impl.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get_list.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/pages/order_production_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class OrderProductionRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<OrderProductionRegisterDatasource>(
          (i) => OrderProductionRegisterDatasourceImpl(),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterRepositoryImpl(
              datasource: i.get<OrderProductionRegisterDatasource>()),
        ),
        Bind.factory(
          (i) => OrderProductionRegisterGetlist(
              repository: i.get<OrderProductionRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => OrderProductionRegisterBloc(
              getlist: i.get<OrderProductionRegisterGetlist>(),
              // post: i.get<ProductRegisterPost>(),
              // put: i.get<ProductRegisterPut>(),
              // delete: i.get<ProductRegisterDelete>(),
              // get: i.get<ProductRegisterGet>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const OrderProductionRegisterPage()),
  ];
}
