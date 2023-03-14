import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterGet
    implements
        UseCase<OrderStockAdjustmentRegisterModel,
            ParamsGetOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterGet({required this.repository});

  @override
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> call(
      ParamsGetOrderStockAdjustmentRegister params) async {
    try {
      final list = await repository.get(productId: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderStockAdjustmentRegister {
  int id;

  ParamsGetOrderStockAdjustmentRegister({required this.id});
}
