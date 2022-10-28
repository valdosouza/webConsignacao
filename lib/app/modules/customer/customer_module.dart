import 'package:appweb/app/modules/customer/presentation/content/content_customer.dart';
import 'package:appweb/app/modules/customer/presentation/pages/customer_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const CustomerPage(),
      children: [
        ChildRoute('/content/', child: (_, args) => const ContentCustomer()),
        //ModuleRoute('/content/customerregister/', module: PaymentTypeRegisterModule()),
      ],
    ),
  ];
}
