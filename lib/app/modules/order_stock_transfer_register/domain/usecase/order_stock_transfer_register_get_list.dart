import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockTransferRegisterGetlist
    implements
        UseCase<List<OrderStockTransferListModel>,
            ParamsGetlistOrderStockTransferRegister> {
  final OrderStockTransferRegisterRepository repository;

  OrderStockTransferRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderStockTransferListModel>>> call(
      ParamsGetlistOrderStockTransferRegister params) async {
    try {
      final list = await repository.getList();
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
