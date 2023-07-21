import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterClosure
    implements UseCase<String, ParamsOrderProductionClosure> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterClosure({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderProductionClosure params) async {
    try {
      final response = await repository.closure(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderProductionClosure {
  OrderStatusModel model;
  ParamsOrderProductionClosure({required this.model});
}
