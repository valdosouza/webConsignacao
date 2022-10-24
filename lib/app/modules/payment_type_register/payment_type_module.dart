import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_datasource.dart';
import 'package:appweb/app/modules/payment_type_register/data/repositories/payment_type_repository_impl.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_add.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/pages/interaction_payment.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/pages/payment.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentTypeRegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => PaymentTypeDataSourceImpl()),
    Bind.factory((i) => PaymentTypeRepositoryImpl(
        paymentTypeDataSource: i.get<PaymentTypeDataSourceImpl>())),
    Bind.factory((i) =>
        PaymentTypeGetlist(repository: i.get<PaymentTypeRepositoryImpl>())),
    Bind.factory(
        (i) => PaymentTypeAdd(repository: i.get<PaymentTypeRepositoryImpl>())),
    Bind.factory(
        (i) => PaymentTypePut(repository: i.get<PaymentTypeRepositoryImpl>())),
    Bind.factory((i) =>
        PaymentTypeDelete(repository: i.get<PaymentTypeRepositoryImpl>())),
    Bind.lazySingleton((i) => PaymentTypeBloc(
          addPaymentType: i.get<PaymentTypeAdd>(),
          deletePaymentType: i.get<PaymentTypeDelete>(),
          getlistPaymentType: i.get<PaymentTypeGetlist>(),
          putPaymentType: i.get<PaymentTypePut>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentPage()),
    ChildRoute('/interaction/',
        child: (_, args) => InteractionPaymentType(payment: args.data)),
  ];
}
