import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:dartz/dartz.dart';
import '../repository/cashier_balance_respository.dart';

class CashierBalanceGet
    implements UseCase<CashierBalanceModel, ParamsCashierBalance> {
  final CashierBalanceRepository repository;
  CashierBalanceGet({required this.repository});

  @override
  Future<Either<Failure, CashierBalanceModel>> call(
      ParamsCashierBalance params) async {
    try {
      final model = await repository.cashierBalanceGet(
        date: params.date,
      );
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierBalance {
  String date;

  ParamsCashierBalance({required this.date});
}
