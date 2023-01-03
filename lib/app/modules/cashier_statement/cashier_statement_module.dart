import 'package:appweb/app/modules/cashier_statement/presentation/pages/statement/cashier_statement_by_day_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/cashier_statement_page.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/statement/cashier_statement_by_month_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/pages/statement/cashier_statement_customer_charged_page_mobile.dart';

import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const CashierStatementPage(),
    ),
    ChildRoute(
      '/mobile/byday/',
      child: (_, args) => const CashierStatementByDayPageMobile(),
    ),
    ChildRoute(
      '/mobile/bymonth/',
      child: (_, args) => const CashierStatementByMonthPageMobile(),
    ),
    ChildRoute(
      '/mobile/customercharged/',
      child: (_, args) => const CashierStatementCustomerChargedPageMobile(),
    )
  ];
}
