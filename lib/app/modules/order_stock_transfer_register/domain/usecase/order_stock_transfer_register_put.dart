import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterPut
    implements
        UseCase<OrderStockTransferListModel,
            ParamsPutOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterPut({required this.repository});

  @override
  Future<Either<Failure, OrderStockTransferListModel>> call(
      ParamsPutOrderStockTransferRegister params) async {
    try {
      final model = await repository.put(model: params.model);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPutOrderStockTransferRegister {
  OrderStockTransferMainModel model;
  ParamsPutOrderStockTransferRegister({required this.model});
}
