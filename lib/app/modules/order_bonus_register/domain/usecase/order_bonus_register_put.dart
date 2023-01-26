import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterPut
    implements UseCase<OrderBonusRegisterModel, ParamsPutOrderBonusRegister> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderBonusRegisterModel>> call(
      ParamsPutOrderBonusRegister params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPutOrderBonusRegister {
  OrderBonusRegisterModel model;
  ParamsPutOrderBonusRegister({required this.model});
}
