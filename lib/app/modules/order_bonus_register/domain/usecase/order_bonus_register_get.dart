import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterGet
    implements UseCase<OrderBonusRegisterModel, ParamsGetOrderBonusRegister> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterGet({required this.repository});

  @override
  Future<Either<Failure, OrderBonusRegisterModel>> call(
      ParamsGetOrderBonusRegister params) async {
    try {
      final list = await repository.get(productId: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderBonusRegister {
  int id;

  ParamsGetOrderBonusRegister({required this.id});
}
