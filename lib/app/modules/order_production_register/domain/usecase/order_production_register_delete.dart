import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class OrderProductionRegisterDelete
    implements UseCase<String, ParamsOrderProductionRegisterDelete> {
  final OrderProductionRegisterRepository repository;

  OrderProductionRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderProductionRegisterDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderProductionRegisterDelete {
  int id;
  ParamsOrderProductionRegisterDelete({required this.id});
}
