import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterGet
    implements
        UseCase<OrderProductionRegisterModel,
            ParamsGetOrderProductionRegister> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterGet({required this.repository});

  @override
  Future<Either<Failure, OrderProductionRegisterModel>> call(
      ParamsGetOrderProductionRegister params) async {
    try {
      final list = await repository.get(productId: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderProductionRegister {
  int id;
  ParamsGetOrderProductionRegister({required this.id});
}
