import 'package:appweb/app/modules/payment/data/datasource/remote/ownapi/payment_datasource.dart';
import 'package:appweb/app/modules/payment/data/repositories/payment_repository_impl.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_add.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_delete.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_getlist.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_put.dart';
import 'package:appweb/app/modules/payment/presentation/pages/interaction_payment.dart';
import 'package:appweb/app/modules/payment/presentation/pages/payment.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => PaymentDataSourceImpl()),
    Bind.factory((i) => PaymentRepositoryImpl(
        paymentDataSource: i.get<PaymentDataSourceImpl>())),
    Bind.factory(
        (i) => PaymentGetlist(repository: i.get<PaymentRepositoryImpl>())),
    Bind.factory((i) => PaymentAdd(repository: i.get<PaymentRepositoryImpl>())),
    Bind.factory((i) => PaymentPut(repository: i.get<PaymentRepositoryImpl>())),
    Bind.factory(
        (i) => PaymentDelete(repository: i.get<PaymentRepositoryImpl>())),
    Bind.lazySingleton((i) => PaymentBloc(
          addPayment: i.get<PaymentAdd>(),
          deletePayment: i.get<PaymentDelete>(),
          getlistPayment: i.get<PaymentGetlist>(),
          putPayment: i.get<PaymentPut>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentPage()),
    ChildRoute('/interaction/',
        child: (_, args) => InteractionPayment(payment: args.data)),
  ];
}
