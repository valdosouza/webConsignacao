import 'package:appweb/app/modules/cashier/presentation/page/cashier_page.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement_summary/cashier_statement_summary_module.dart';
import 'package:appweb/app/modules/sales_average/sales_average_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/mobile/', child: (_, args) => const CashierPage()),
    ChildRoute(
      '/desktop/',
      child: (_, args) => const CashierPage(),
      children: [
        ModuleRoute(
          '/cashierstatement/',
          module: CashierStatementModule(),
        ),
        ModuleRoute(
          '/cashierstatementsummary/',
          module: CashierStatementSummaryModule(),
        ),
        ModuleRoute(
          '/salesaverage/',
          module: SalesAverageModule(),
        ),
      ],
    ),
  ];
}
