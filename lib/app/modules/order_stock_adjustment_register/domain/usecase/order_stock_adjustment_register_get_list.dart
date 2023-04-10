import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';

class OrderStockAdjustmentRegisterGetlist
    implements
        UseCase<List<OrderStockAdjustmentListModel>,
            ParamsGetlistOrderStockAdjustmentRegister> {
  final OrderStockAdjustmentRegisterRepository repository;

  OrderStockAdjustmentRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<OrderStockAdjustmentListModel>>> call(
      ParamsGetlistOrderStockAdjustmentRegister params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistOrderStockAdjustmentRegister {
  int id;
  ParamsGetlistOrderStockAdjustmentRegister({required this.id});
}
