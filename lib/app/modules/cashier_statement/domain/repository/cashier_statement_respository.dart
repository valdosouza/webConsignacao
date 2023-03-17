import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_salesman_model.dart';
import 'package:dartz/dartz.dart';

abstract class CashierStatementRepository {
  Future<Either<Failure, List<CashierStatementModel>>> cashierStatementGetByDay(
      {required CashierStatementParams params});
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByMonth({required CashierStatementParams params});
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByCustomer({required CashierStatementParams params});
  Future<Either<Failure, List<CashierStatementCustomerModel>>>
      cashierStatementGetCustomers({required CashierStatementParams params});
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByOrder({required CashierStatementParams params});
  Future<Either<Failure, List<CashierStatementSalesmanModel>>>
      cashierStatementGetSalesmans({required CashierStatementParams params});
}
