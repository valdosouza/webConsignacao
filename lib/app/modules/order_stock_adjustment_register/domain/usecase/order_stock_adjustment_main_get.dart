import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_main_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentMainGet
    implements
        UseCase<OrderStockAdjustmentMainModel,
            ParamsGetOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentMainGet({required this.repository});

  @override
  Future<Either<Failure, OrderStockAdjustmentMainModel>> call(
      ParamsGetOrderStockAdjustmentRegister params) async {
    try {
      final list = await repository.get(orderId: params.orderid);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderStockAdjustmentRegister {
  int orderid;

  ParamsGetOrderStockAdjustmentRegister({required this.orderid});
}
