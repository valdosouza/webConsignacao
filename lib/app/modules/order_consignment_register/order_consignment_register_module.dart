import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_checkpoint_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_supplying_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/data/repository/order_consignment_checkpoint_repository_impl.dart';
import 'package:appweb/app/modules/order_consignment_register/data/repository/order_consignment_repository_impl.dart';
import 'package:appweb/app/modules/order_consignment_register/data/repository/order_consignment_supplying_repository_impl.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_checkpoint_post.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_get_checkpoint.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_get_supplying.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_getlist.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_supplying_getlast.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_supplying_post.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/page/register/order_consignment_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class OrderConsignmentRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<OrderConsignmentCheckpointDatasource>((i) =>
            OrderConsignmentCheckpointDatasourceImpl(
                httpClient: http.Client())),
        Bind.factory((i) => OrderConsignmentCheckpointRepositoryImpl(
            orderConsignmentCheckpointDatasource:
                i.get<OrderConsignmentCheckpointDatasourceImpl>())),
        Bind.factory((i) => OrderConsignmentCheckpointPost(
            repository: i.get<OrderConsignmentCheckpointRepositoryImpl>())),
        Bind.factory<OrderConsignmentSupplyingDatasource>((i) =>
            OrderConsignmentSupplyingDatasourceImpl(httpClient: http.Client())),
        Bind.factory((i) => OrderConsignmentSupplyingRepositoryImpl(
            orderSupplying: i.get<OrderConsignmentSupplyingDatasourceImpl>())),
        Bind.factory((i) => OrderConsignmentSupplyingPost(
            repository: i.get<OrderConsignmentSupplyingRepositoryImpl>())),
        Bind.factory((i) => OrderConsignmentSupplyingGetlast(
            repository: i.get<OrderConsignmentSupplyingRepositoryImpl>())),
        Bind.factory<OrderConsignmentDatasourceImpl>(
            (i) => OrderConsignmentDatasourceImpl(httpClient: http.Client())),
        Bind.factory((i) => OrderConsignmentRepositoryImpl(
            orderConsignment: i.get<OrderConsignmentDatasourceImpl>())),
        Bind.factory((i) => OrderConsignmentGetlist(
            repository: i.get<OrderConsignmentRepositoryImpl>())),
        Bind.factory((i) => OrderConsignmentGetCheckpoint(
            repository: i.get<OrderConsignmentRepositoryImpl>())),
        Bind.factory((i) => OrderConsignmentGetSupplying(
            repository: i.get<OrderConsignmentRepositoryImpl>())),
        BlocBind.singleton((i) => OrderConsignmentRegisterBloc(
              getlastSupplying: i.get<OrderConsignmentSupplyingGetlast>(),
              postSupplying: i.get<OrderConsignmentSupplyingPost>(),
              postCheckpoint: i.get<OrderConsignmentCheckpointPost>(),
              orderConsignmentGetlist: i.get<OrderConsignmentGetlist>(),
              orderConsignmentGetCheckpoint:
                  i.get<OrderConsignmentGetCheckpoint>(),
              orderConsignmentGetSupplying:
                  i.get<OrderConsignmentGetSupplying>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => OrderConsginmentRegisterPage(
                orderAttendance: args.data[0], historic: args.data[1])),
      ];
}
