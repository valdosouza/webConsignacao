import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterReopen
    implements UseCase<String, ParamsOrderStocktransferReopen> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterReopen({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderStocktransferReopen params) async {
    try {
      final response = await repository.reopen(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderStocktransferReopen {
  OrderStatusModel model;
  ParamsOrderStocktransferReopen({required this.model});
}
