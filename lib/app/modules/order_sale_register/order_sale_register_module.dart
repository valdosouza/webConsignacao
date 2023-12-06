import 'package:appweb/app/modules/order_sale_register/data/datasource/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/repository/order_sale_register_repository_impl.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/get_order_sale_card.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_get_items.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_post.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/register/order_sale_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class OrderSaleRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<OrderSaleRegisterDatasource>(
          (i) => OrderSaleRegisterDatasourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterRepositoryImpl(
              datasource: i.get<OrderSaleRegisterDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleRegisterPost(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => GetNewOrderSaleCard(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => OrderSaleGetlist(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => GetOrderSaleCard(
              repository: i.get<OrderSaleRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton(
          (i) => OrderSaleRegisterBloc(
            getNewOrderSaleCard: i.get<GetNewOrderSaleCard>(),
            postOrderSale: i.get<OrderSaleRegisterPost>(),
            orderSaleGetlist: i.get<OrderSaleGetlist>(),
            getOrderSaleCard: i.get<GetOrderSaleCard>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => OrderSaleRegisterPage(
                  orderAttendance: args.data[0],
                  historic: args.data[1],
                )),
      ];
}
