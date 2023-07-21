import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_register_datasource.dart';
import 'package:appweb/app/modules/payment_type_register/data/repository/payment_type_repository_impl.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_post.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/page/payment_type_register.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:http/http.dart' as http;

class PaymentTypeRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<PaymentTypeRegisterDataSource>(
          (i) => PaymentTypeRegisterDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory(
          (i) => PaymentTypeRegisterRepositoryImpl(
              datasource: i.get<PaymentTypeRegisterDataSource>()),
        ),
        Bind.factory(
          (i) => PaymentTypeRegisterGetlist(
              repository: i.get<PaymentTypeRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PaymentTypeRegisterPost(
              repository: i.get<PaymentTypeRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PaymentTypeRegisterPut(
              repository: i.get<PaymentTypeRegisterRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PaymentTypeRegisterDelete(
              repository: i.get<PaymentTypeRegisterRepositoryImpl>()),
        ),
        BlocBind.singleton((i) => PaymentTypeRegisterBloc(
              getlist: i.get<PaymentTypeRegisterGetlist>(),
              post: i.get<PaymentTypeRegisterPost>(),
              put: i.get<PaymentTypeRegisterPut>(),
              delete: i.get<PaymentTypeRegisterDelete>(),
            )),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentTypeRegister()),
  ];
}
