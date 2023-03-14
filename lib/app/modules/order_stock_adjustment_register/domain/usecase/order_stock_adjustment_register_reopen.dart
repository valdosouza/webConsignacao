import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterReopen
    implements UseCase<String, ParamsOrderStockAdjustmentReopen> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterReopen({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderStockAdjustmentReopen params) async {
    try {
      final response = await repository.reopen(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderStockAdjustmentReopen {
  OrderStatusModel model;
  ParamsOrderStockAdjustmentReopen({required this.model});
}
