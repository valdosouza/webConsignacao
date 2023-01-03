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
          tbInstitutionId: params.tbInstitutionId,
          date: params.date,
          tbUserId: params.tbUserId);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierBalance {
  int tbInstitutionId;
  String date;
  int tbUserId;
  ParamsCashierBalance(
      {required this.tbInstitutionId,
      required this.date,
      required this.tbUserId});
}
