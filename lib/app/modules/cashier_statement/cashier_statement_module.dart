import 'package:appweb/app/modules/cashier_statement/data/datasource/cashier_statement_datasource.dart';
import 'package:appweb/app/modules/cashier_statement/data/repository/cashier_statement_repository_impl.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_customer.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_day.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_month.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_order.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_current_date.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_customers.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/get_customer_old_debits_by_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/desktop/customers_served_desktop.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/desktop/customers_debit_page_desktop.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/cashier_statement_by_customer_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/cashier_statement_by_day_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/page.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/cashier_statement_by_month_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/cashier_statement_by_order_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/cashier_statement_customers_charged_page_mobile.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/page/mobile/customers_debit_page_mobile.dart';
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
        Bind.factory<CashierStatementGetSalesmans>((i) =>
            CashierStatementGetSalesmans(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<CashierStatementGetCurrentDate>((i) =>
            CashierStatementGetCurrentDate(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<GetCustomerOldDebitsBySalesman>((i) =>
            GetCustomerOldDebitsBySalesman(
                repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.factory<GetSalesmans>((i) =>
            GetSalesmans(repository: i.get<CashierStatementRepositoryImpl>())),
        Bind.singleton<CashierStatementBloc>(
          (i) => CashierStatementBloc(
            byDay: i.get<CashierStatementGetByDay>(),
            byMonth: i.get<CashierStatementGetByMonth>(),
            byCustomer: i.get<CashierStatementGetByCustomer>(),
            byOrder: i.get<CashierStatementGetByOrder>(),
            customersCharged: i.get<CashierStatementGetCustomers>(),
            salesmanCustomersCharged: i.get<CashierStatementGetSalesmans>(),
            getCurrentDate: i.get<CashierStatementGetCurrentDate>(),
            getCustomerOldDebitsBySalesman:
                i.get<GetCustomerOldDebitsBySalesman>(),
            getSalesmans: i.get<GetSalesmans>(),
          ),
        )
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/mobile/',
      child: (_, args) => const Page(),
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
      '/mobile/customersdebit/',
      child: (_, args) => const CustomersDebitPageMobile(),
    ),
    ChildRoute(
      '/mobile/bycustomer/',
      child: (_, args) => const CashierStatementByCustomerPageMobile(),
    ),
    ChildRoute(
      '/mobile/byorder/',
      child: (_, args) => const CashierStatementByOrderPageMobile(),
    ),
    ChildRoute(
      '/desktop/salesman/salesmanlist/',
      child: (_, args) => const CustomersServedDesktop(),
    ),
    ChildRoute(
      '/desktop/customersdebit/',
      child: (_, args) => const CustomersDebitPageDesktop(),
    ),
  ];
}
