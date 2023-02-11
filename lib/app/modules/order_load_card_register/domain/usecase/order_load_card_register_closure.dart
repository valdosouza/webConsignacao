import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegisterClosure
    implements UseCase<String, ParamsOrderLoadCardClosure> {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegisterClosure({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderLoadCardClosure params) async {
    try {
      final response = await repository.closure(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderLoadCardClosure {
  OrderLoadCardMainModel model;
  ParamsOrderLoadCardClosure({required this.model});
}
