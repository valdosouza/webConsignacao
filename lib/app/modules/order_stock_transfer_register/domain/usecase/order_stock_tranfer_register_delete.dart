import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterDelete
    implements UseCase<String, ParamOrderStockTransferRegisterDelete> {
  final OrderStockTransferRegisterRepository repository;
  OrderStockTransferRegisterDelete({required this.repository});
  @override
  Future<Either<Failure, String>> call(params) async {
    try {
      final response = await repository.delete(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamOrderStockTransferRegisterDelete {
  ParamOrderStockTransferRegisterDelete({
    required this.id,
  });
  int id;
}
