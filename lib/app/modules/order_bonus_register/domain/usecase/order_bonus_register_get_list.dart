import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterGetlist
    implements
        UseCase<List<OrderBonusRegisterModel>,
            ParamsGetlistOrderBonusRegister> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderBonusRegisterModel>>> call(
      ParamsGetlistOrderBonusRegister params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistOrderBonusRegister {
  ParamsGetlistOrderBonusRegister();
}
