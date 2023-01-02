import 'package:appweb/app/modules/order_stock_adjustment_register/order_stock_adjustment_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/stock/presentation/pages/stock_page.dart';
import 'package:appweb/app/modules/stock_balance_customer/stock_balance_customer_module.dart';
import 'package:appweb/app/modules/stock_balance_general/stock_balance_general_module.dart';
import 'package:appweb/app/modules/stock_balance_salesman/stock_balance_salesman_module.dart';
import 'package:appweb/app/modules/stock_list_register/stock_list_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/content/',
      child: (_, args) => const StockPage(),
      children: [
        ModuleRoute('/stocklist/', module: StockListRegisterModule()),
        ModuleRoute('/stockadjustement/',
            module: OrderStockAdjustmentRegisterModule()),
        ModuleRoute('/stockgeneral/',
            module: StockBalanceGeneralModule()),
        ModuleRoute('/stocksalesman/',
            module: StockBalanceSalesmanModule()),
        ModuleRoute('/stockcustomer/',
            module: StockBalanceCustomerModule()),
        ModuleRoute('/stocktransfer/',
            module: OrderStockTransferRegisterModule()),
        ChildRoute('/stockstatement/',
            child: (_, args) => const Center(
                  child: Text("Movimentação de Estoque"),
                )),
      ],
    ),
  ];
}
