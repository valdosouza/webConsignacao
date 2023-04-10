import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_main_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterPut
    implements
        UseCase<OrderStockAdjustmentListModel,
            ParamsPutOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderStockAdjustmentListModel>> call(
      ParamsPutOrderStockAdjustmentRegister params) async {
    try {
      final model = await repository.put(model: params.model);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPutOrderStockAdjustmentRegister {
  OrderStockAdjustmentMainModel model;
  ParamsPutOrderStockAdjustmentRegister({required this.model});
}
