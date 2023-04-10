import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterReopen
    implements UseCase<String, ParamsOrderSaleReopen> {
  final OrderSaleRegisterRepository repository;

  OrderSaleRegisterReopen({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsOrderSaleReopen params) async {
    try {
      final response = await repository.reopen(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderSaleReopen {
  OrderStatusModel model;
  ParamsOrderSaleReopen({required this.model});
}
