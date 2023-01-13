import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class OrderStockTransferRegisterDelete
    implements UseCase<String, ParamsDeleteOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsDeleteOrderStockTransferRegister params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDeleteOrderStockTransferRegister {
  int id;
  ParamsDeleteOrderStockTransferRegister({required this.id});
}
