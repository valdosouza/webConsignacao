import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterGetList
    implements
        UseCase<List<OrderStockTransferRegisterOrderModel>,
            ParamsGetlistOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterGetList({required this.repository});

  @override
  Future<Either<Failure, List<OrderStockTransferRegisterOrderModel>>> call(
      ParamsGetlistOrderStockTransferRegister params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistOrderStockTransferRegister {
  int id;
  ParamsGetlistOrderStockTransferRegister({required this.id});
}
