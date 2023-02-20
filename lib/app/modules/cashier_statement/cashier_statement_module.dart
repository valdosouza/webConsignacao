import 'package:appweb/app/modules/cashier_statement/data/datasource/cashier_statement_datasource.dart';
import 'package:appweb/app/modules/cashier_statement/data/repository/cashier_statement_repository_impl.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_customer.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_day.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_month.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_order.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_customer.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/statement/cashier_statement_by_customer_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/statement/cashier_statement_by_day_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/cashier_statement_page.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/statement/cashier_statement_by_month_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/statement/cashier_statement_by_order_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/statement/cashier_statement_customers_charged_page_mobile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<CashierStatementDataSource>(
          (i) => CashierStatementDataSourceImpl(httpClient: http.Client()),
        ),
        Bind.factory<CashierStatementRepositoryImpl>(
          (i) => CashierStatementRepositoryImpl(
              datasource: i.get<CashierStatementDataSourceImpl>()),
        ),
        Bind.factory<CashierStatementGetByDay>((i) => CashierStatementGetByDay(
            repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<CashierStatementGetByMonth>((i) =>
            CashierStatementGetByMonth(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<CashierStatementGetByCustomer>((i) =>
            CashierStatementGetByCustomer(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<CashierStatementGetByOrder>((i) =>
            CashierStatementGetByOrder(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<CashierStatementGetCustomers>((i) =>
            CashierStatementGetCustomers(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.singleton<CashierStatementBloc>(
          (i) => CashierStatementBloc(
              byDay: i.get<CashierStatementGetByDay>(),
              byMonth: i.get<CashierStatementGetByMonth>(),
              byCustomer: i.get<CashierStatementGetByCustomer>(),
              byOrder: i.get<CashierStatementGetByOrder>(),
              customersCharged: i.get<CashierStatementGetCustomers>()),
        )
      ];
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
      '/mobile/customerscharged/',
      child: (_, args) => const CashierStatementCustomersChargedPageMobile(),
    ),
    ChildRoute(
      '/mobile/bycustomer/',
      child: (_, args) => const CashierStatementByCustomerPageMobile(),
    ),
    ChildRoute(
      '/mobile/byorder/',
      child: (_, args) => const CashierStatementByOrderPageMobile(),
    )
  ];
}
