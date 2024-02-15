import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';
import 'package:appweb/app/modules/cashier_statement/domain/repository/cashier_statement_respository.dart';
import 'package:dartz/dartz.dart';

class GetCustomerOldDebitsBySalesman
    implements UseCase<List<CustomersOldDebitModel>, CashierStatementParams> {
  final CashierStatementRepository repository;
  GetCustomerOldDebitsBySalesman({required this.repository});

  @override
  Future<Either<Failure, List<CustomersOldDebitModel>>> call(
      CashierStatementParams params) async {
    try {
      final model =
          await repository.getCustomersOldDebitBySalesman(params: params);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
