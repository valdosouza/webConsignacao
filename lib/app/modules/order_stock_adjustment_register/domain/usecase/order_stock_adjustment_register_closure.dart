import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterClosure
    implements UseCase<String, ParamsOrderStockAdjustmentClosure> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterClosure({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderStockAdjustmentClosure params) async {
    try {
      final response = await repository.closure(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderStockAdjustmentClosure {
  OrderStatusModel model;
  ParamsOrderStockAdjustmentClosure({required this.model});
}
