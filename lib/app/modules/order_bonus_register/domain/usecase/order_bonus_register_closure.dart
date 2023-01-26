import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/repository/order_bonus_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderBonusRegisterClosure
    implements UseCase<String, ParamsOrderBonusClosure> {
  final OrderBonusRegisterRepository repository;

  OrderBonusRegisterClosure({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsOrderBonusClosure params) async {
    try {
      final response = await repository.closure(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderBonusClosure {
  OrderStatusModel model;
  ParamsOrderBonusClosure({required this.model});
}
