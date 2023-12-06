import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class CashierIsOpen
    implements UseCase<CashierStatusModel, ParamsCashierIsOpen> {
  final OrderLoadCardRegisterRepository repository;

  CashierIsOpen({required this.repository});

  @override
  Future<Either<Failure, CashierStatusModel>> call(
      ParamsCashierIsOpen params) async {
    try {
      final cashier = await repository.cashierIsOpen();
      return cashier;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierIsOpen {
  ParamsCashierIsOpen();
}
