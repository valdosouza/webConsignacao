import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterGetlist
    implements
        UseCase<List<OrderProductionRegisterModel>,
            ParamsGetlistOrderProductionRegister> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderProductionRegisterModel>>> call(
      ParamsGetlistOrderProductionRegister params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistOrderProductionRegister {
  ParamsGetlistOrderProductionRegister();
}
