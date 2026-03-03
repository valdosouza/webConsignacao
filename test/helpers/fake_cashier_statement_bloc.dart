import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/domain/repository/cashier_statement_respository.dart';
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
import 'package:dartz/dartz.dart';

/// Fake repository for cashier statement tests.
class FakeCashierStatementRepository implements CashierStatementRepository {
  FakeCashierStatementRepository({this.dtRecordForToday = '24/02/2025'});

  final String dtRecordForToday;

  @override
  Future<Either<Failure, List<CashierStatementModel>>> cashierStatementGetByDay(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByMonth(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByCustomer(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<CashierStatementCustomerModel>>>
      cashierStatementGetCustomers(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByOrder(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<CashierStatementSalesmanModel>>>
      cashierStatementGetSalesmans(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, CashierStatusModel>> cashierStatementGetCurrentDate() async =>
      Right(CashierStatusModel(dtRecord: dtRecordForToday, status: 'A'));

  @override
  Future<Either<Failure, List<CustomersOldDebitModel>>>
      getCustomersOldDebitBySalesman(
          {required CashierStatementParams params}) async =>
      Right([]);

  @override
  Future<Either<Failure, List<SalesmanModel>>> getSalesman() async =>
      Right([]);
}

/// Creates a bloc for widget tests. getCurrentDate returns [dtRecordForToday].
CashierStatementBloc createFakeCashierStatementBloc({
  String dtRecordForToday = '24/02/2025',
}) {
  final repo = FakeCashierStatementRepository(dtRecordForToday: dtRecordForToday);
  return CashierStatementBloc(
    byDay: CashierStatementGetByDay(repository: repo),
    byMonth: CashierStatementGetByMonth(repository: repo),
    byCustomer: CashierStatementGetByCustomer(repository: repo),
    byOrder: CashierStatementGetByOrder(repository: repo),
    customersCharged: CashierStatementGetCustomers(repository: repo),
    salesmanCustomersCharged: CashierStatementGetSalesmans(repository: repo),
    getCurrentDate: CashierStatementGetCurrentDate(repository: repo),
    getCustomerOldDebitsBySalesman:
        GetCustomerOldDebitsBySalesman(repository: repo),
    getSalesmans: GetSalesmans(repository: repo),
  );
}
