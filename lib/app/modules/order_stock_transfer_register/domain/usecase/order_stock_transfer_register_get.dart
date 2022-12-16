import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterGet
    implements
        UseCase<OrderStockTransferRegisterOrderModel,
            ParamsGetOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterGet({required this.repository});

  @override
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> call(
    ParamsGetOrderStockTransferRegister params,
  ) async {
    try {
      final list = await repository.get(
        orderStockId: params.id,
        intitutionId: params.intitutionId,
      );
      // Either<Failure, OrderStockTransferRegisterOrderModel>
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetOrderStockTransferRegister {
  ParamsGetOrderStockTransferRegister({
    required this.id,
    required this.intitutionId,
  });
  int id;
  int intitutionId;
}
