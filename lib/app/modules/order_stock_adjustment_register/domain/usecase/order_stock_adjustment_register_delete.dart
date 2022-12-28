import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class OrderStockAdjustmentRegisterDelete
    implements UseCase<String, ParamsDeleteOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsDeleteOrderStockAdjustmentRegister params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDeleteOrderStockAdjustmentRegister {
  int id;
  ParamsDeleteOrderStockAdjustmentRegister({required this.id});
}
