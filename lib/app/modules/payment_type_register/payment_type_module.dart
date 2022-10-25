import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_datasource.dart';
import 'package:appweb/app/modules/payment_type_register/data/repositories/payment_type_repository_impl.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_post.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/pages/payment_type_register.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class PaymentTypeRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<PaymentTypeDatasource>(
          (i) => PaymentTypeDatasourceImpl(),
        ),
        Bind.factory(
          (i) => PaymentTypeRepositoryImpl(
              datasource: i.get<PaymentTypeDatasourceImpl>()),
        ),
        Bind.factory(
          (i) => PaymentTypeGetlist(
              repository: i.get<PaymentTypeRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              PaymentTypeDelete(repository: i.get<PaymentTypeRepositoryImpl>()),
        ),
        Bind.factory(
          (i) =>
              PaymentTypePost(repository: i.get<PaymentTypeRepositoryImpl>()),
        ),
        Bind.factory(
          (i) => PaymentTypePut(repository: i.get<PaymentTypeRepositoryImpl>()),
        ),
        BlocBind.factory(
          (i) => PaymentTypeBloc(
            getlist: i.get<PaymentTypeGetlist>(),
            delete: i.get<PaymentTypeDelete>(),
            post: i.get<PaymentTypePost>(),
            put: i.get<PaymentTypePut>(),
          ),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentTypeRegister()),
  ];
}
