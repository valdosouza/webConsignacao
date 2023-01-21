import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_status_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterReopen
    implements UseCase<String, ParamsOrderProductionReopen> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterReopen({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderProductionReopen params) async {
    try {
      final response = await repository.reopen(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderProductionReopen {
  OrderProductionStatusModel model;
  ParamsOrderProductionReopen({required this.model});
}
