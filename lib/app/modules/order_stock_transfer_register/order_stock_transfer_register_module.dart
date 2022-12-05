import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/pages/stock_transfer_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockTransferRegisterModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const OrderStockTransferRegisterPage(),
    ),
  ];
}
