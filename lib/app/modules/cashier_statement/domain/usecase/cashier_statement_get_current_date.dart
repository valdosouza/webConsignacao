import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_statement/domain/repository/cashier_statement_respository.dart';
import 'package:dartz/dartz.dart';

class CashierStatementGetCurrentDate
    implements
        UseCase<CashierStatusModel, ParamsCashierStatementGetCurrentDate> {
  final CashierStatementRepository repository;

  CashierStatementGetCurrentDate({required this.repository});

  @override
  Future<Either<Failure, CashierStatusModel>> call(
      ParamsCashierStatementGetCurrentDate params) async {
    try {
      final list = await repository.cashierStatementGetCurrentDate();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierStatementGetCurrentDate {
  ParamsCashierStatementGetCurrentDate();
}
