import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterPost
    implements UseCase<OrderBonusRegisterModel, ParamsPostOrderBonusRegister> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderBonusRegisterModel>> call(
      ParamsPostOrderBonusRegister params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostOrderBonusRegister {
  OrderBonusRegisterModel model;
  ParamsPostOrderBonusRegister({required this.model});
}
