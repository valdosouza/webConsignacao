import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/datasource/cashier_statement_datasource.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/domain/repository/cashier_statement_respository.dart';
import 'package:dartz/dartz.dart';

class CashierStatementRepositoryImpl implements CashierStatementRepository {
  final CashierStatementDataSource datasource;

  CashierStatementRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByCustomer(
          {required CashierStatementParams params}) async {
    try {
      final model =
          await datasource.cashierStatementGetByCustomer(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByOrder(
          {required CashierStatementParams params}) async {
    try {
      final model = await datasource.cashierStatementGetByOrder(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierStatementModel>>> cashierStatementGetByDay(
      {required CashierStatementParams params}) async {
    try {
      final model = await datasource.cashierStatementGetByDay(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierStatementModel>>>
      cashierStatementGetByMonth(
          {required CashierStatementParams params}) async {
    try {
      final model = await datasource.cashierStatementGetByMonth(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierStatementCustomerModel>>>
      cashierStatementGetCustomers(
          {required CashierStatementParams params}) async {
    try {
      final model =
          await datasource.cashierStatementGetCustomers(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierStatementSalesmanModel>>>
      cashierStatementGetSalesmans(
          {required CashierStatementParams params}) async {
    try {
      final model =
          await datasource.cashierStatementGetSalesmans(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CashierStatusModel>>
      cashierStatementGetCurrentDate() async {
    try {
      final result = await datasource.cashierStatementGetCurrentDate();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CustomersOldDebitModel>>>
      getCustomersOldDebitBySalesman(
          {required CashierStatementParams params}) async {
    try {
      final result =
          await datasource.getCustomerOldDebitBySalesman(params: params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalesmanModel>>> getSalesman() async {
    try {
      final model = await datasource.getSalesmans();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
