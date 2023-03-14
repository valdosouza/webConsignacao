import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferMainGet
    implements
        UseCase<OrderStockTransferMainModel,
            ParamsGetOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferMainGet({required this.repository});

  @override
  Future<Either<Failure, OrderStockTransferMainModel>> call(
      ParamsGetOrderStockTransferRegister params) async {
    try {
      final list = await repository.get(orderId: params.orderid);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderStockTransferRegister {
  int orderid;

  ParamsGetOrderStockTransferRegister({required this.orderid});
}
