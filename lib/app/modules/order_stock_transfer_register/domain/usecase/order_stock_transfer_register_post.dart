import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterPost
    implements
        UseCase<OrderStockTransferListModel,
            ParamsPostOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterPost({required this.repository});

  @override
  Future<Either<Failure, OrderStockTransferListModel>> call(
      ParamsPostOrderStockTransferRegister params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostOrderStockTransferRegister {
  OrderStockTransferMainModel model;
  ParamsPostOrderStockTransferRegister({required this.model});
}
