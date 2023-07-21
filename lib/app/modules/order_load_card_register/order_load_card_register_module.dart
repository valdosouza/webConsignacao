import 'package:appweb/app/modules/order_load_card_register/data/datasource/order_load_card_register_datasource.dart';
import 'package:appweb/app/modules/order_load_card_register/data/repository/order_load_card_register_repository_impl.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_closure.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_items.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list.dart';
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
              orderLoadCardDatasource:
                  i.get<OrderLoadCardRegisterDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegisterPost(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegiterGetItems(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegiterGetList(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderLoadCardRegisterClosure(
              repository: i.get<OrderLoadCardRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton(
          (i) => OrderLoadCardRegisterBloc(
            getItemsOrderLoadCard: i.get<OrderLoadCardRegiterGetItems>(),
            getListOrderLoadCard: i.get<OrderLoadCardRegiterGetList>(),
            postOrderLoadCard: i.get<OrderLoadCardRegisterPost>(),
            closureOrderLoadCard: i.get<OrderLoadCardRegisterClosure>(),
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
