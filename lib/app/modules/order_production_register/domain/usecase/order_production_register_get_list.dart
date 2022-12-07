import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderProductionRegisterGetlist
    implements
        UseCase<List<OrderProductionRegisterModel>, ParamsOrderProductionRegisterGetlist> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderProductionRegisterModel>>> call(
      ParamsOrderProductionRegisterGetlist params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderProductionRegisterGetlist {
  int id;
  ParamsOrderProductionRegisterGetlist({required this.id});
}
