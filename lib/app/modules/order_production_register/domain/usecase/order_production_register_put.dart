import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterPut
    implements UseCase<OrderProductionRegisterModel, ParamsOrderProductionRegisterPut> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderProductionRegisterModel>> call(
      ParamsOrderProductionRegisterPut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderProductionRegisterPut {
  OrderProductionRegisterModel model;
  ParamsOrderProductionRegisterPut({required this.model});
}
