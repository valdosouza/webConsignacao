import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_main_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterPost
    implements
        UseCase<OrderStockAdjustmentListModel,
            ParamsPostOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderStockAdjustmentListModel>> call(
      ParamsPostOrderStockAdjustmentRegister params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostOrderStockAdjustmentRegister {
  OrderStockAdjustmentMainModel model;
  ParamsPostOrderStockAdjustmentRegister({required this.model});
}
