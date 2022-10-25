import 'package:appweb/app/modules/financial/presentation/content/content_financial.dart';
import 'package:appweb/app/modules/financial/presentation/pages/financial_page.dart';
import 'package:appweb/app/modules/payment_type_register/payment_type_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const FinancialPage(),
      children: [
        ChildRoute('/content/', child: (_, args) => const ContentFinancial()),
        ModuleRoute('/content/paymentType/',
            module: PaymentTypeRegisterModule()),
      ],
    ),
  ];
}
