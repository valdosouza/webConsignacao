import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page_desktop.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page_mobile.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:appweb/app/modules/stock_list_register/stock_list_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/desktop/',
      child: (_, args) => const StocPageDesktop(),
      children: [
        ModuleRoute('/stocklist/', module: StockListRegisterModule()),
        ModuleRoute('/stockadjustement/',
            module: OrderStockAdjustmentRegisterModule()),
        ModuleRoute('/stocktransfer/',
            module: OrderStockTransferRegisterModule()),
        ChildRoute('/stockstatement/',
            child: (_, args) => const Center(
                  child: Text("Movimentação de Estoque"),
                )),
      ],
    ),
    ChildRoute(
      '/mobile/',
      child: (_, args) => const StocPageMobile(),
      children: [
        ModuleRoute('/', module: StockBalanceModule()),
      ],
    ),
  ];
}
