import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterClosure
    implements UseCase<String, ParamsOrderStockTransferClosure> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterClosure({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsOrderStockTransferClosure params) async {
    try {
      final response = await repository.closure(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsOrderStockTransferClosure {
  OrderStatusModel model;
  ParamsOrderStockTransferClosure({required this.model});
}
