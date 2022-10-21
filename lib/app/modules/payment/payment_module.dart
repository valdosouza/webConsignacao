import 'package:appweb/app/modules/payment/presentation/pages/payment.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_cubit.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_events.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentCubit()),
    Bind.lazySingleton((i) => PaymentEventsImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PaymentPage()),
  ];
}
