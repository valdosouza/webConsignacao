import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class OrderBonusRegisterDelete
    implements UseCase<String, ParamsDeleteOrderBonusRegister> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsDeleteOrderBonusRegister params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDeleteOrderBonusRegister {
  int id;
  ParamsDeleteOrderBonusRegister({required this.id});
}
