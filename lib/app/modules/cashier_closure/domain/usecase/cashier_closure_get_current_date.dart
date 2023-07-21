import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';

class CashierClosureGetCurrentDate
    implements UseCase<CashierStatusModel, ParamsCashierClosureGetCurrentDate> {
  final CashierClosureRepository repository;

  CashierClosureGetCurrentDate({required this.repository});

  @override
  Future<Either<Failure, CashierStatusModel>> call(
      ParamsCashierClosureGetCurrentDate params) async {
    try {
      final list = await repository.cashierClosureGetCurrentDate();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierClosureGetCurrentDate {
  ParamsCashierClosureGetCurrentDate();
}
