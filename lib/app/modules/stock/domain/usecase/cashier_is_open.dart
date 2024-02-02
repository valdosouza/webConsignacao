import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class CashierIsOpen
    implements UseCase<CashierStatusModel, ParamsCashierIsOpen> {
  final Repository repository;

  CashierIsOpen({required this.repository});

  @override
  Future<Either<Failure, CashierStatusModel>> call(
      ParamsCashierIsOpen params) async {
    try {
      final list = await repository.cashierIsOpen();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierIsOpen {
  ParamsCashierIsOpen();
}
