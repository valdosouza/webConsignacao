import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterPost
    implements UseCase<OrderProductionRegisterModel, ParamsPostOrderProductionRegister> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderProductionRegisterModel>> call(
      ParamsPostOrderProductionRegister params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostOrderProductionRegister {
  OrderProductionRegisterModel model;
  ParamsPostOrderProductionRegister({required this.model});
}
