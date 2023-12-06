import 'package:appweb/app/modules/order_load_card_register/data/datasource/order_load_card_register_datasource.dart';
import 'package:appweb/app/modules/order_load_card_register/data/repository/order_load_card_register_repository_impl.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/cashier_is_open.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_closure.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list_by_user.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_post.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/page/order_load_card_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class OrderLoadCardRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<OrderLoadCardRegisterDatasource>(
          (i) => OrderLoadCardRegisterDatasourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegisterRepositoryImpl(
              datasource: i.get<OrderLoadCardRegisterDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegisterPost(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => GetNewOrderLoadCard(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegiterGetList(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegiterGetListByUser(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegiterGet(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegisterClosure(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => CashierIsOpen(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton(
          (i) => OrderLoadCardRegisterBloc(
            getNewOrderLoadCard: i.get<GetNewOrderLoadCard>(),
            getListOrderLoadCard: i.get<OrderLoadCardRegiterGetList>(),
            getListByUserOrderLoadCard:
                i.get<OrderLoadCardRegiterGetListByUser>(),
            postOrderLoadCard: i.get<OrderLoadCardRegisterPost>(),
            closureOrderLoadCard: i.get<OrderLoadCardRegisterClosure>(),
            getByOrderLoadCard: i.get<OrderLoadCardRegiterGet>(),
            cashierIsOpen: i.get<CashierIsOpen>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const OrderLoadCardRegisterPage(),
        ),
      ];
}
