import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterPost
    implements
        UseCase<OrderStockTransferRegisterOrderModel,
            ParamOrderStockTransferRegisterPost> {
  final OrderStockTransferRegisterRepository repository;
  OrderStockTransferRegisterPost({required this.repository});
  @override
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> call(
      params) async {
    try {
      final response = await repository.post(model: params.order);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamOrderStockTransferRegisterPost {
  OrderStockTransferRegisterOrderModel order;
  ParamOrderStockTransferRegisterPost({
    required this.order,
  });
}
