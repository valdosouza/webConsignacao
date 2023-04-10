import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_respository.dart';
import 'package:dartz/dartz.dart';

class StockListGetlist
    implements UseCase<List<StockListModel>, ParamsGetListStock> {
  final OrderSaleRegisterRepository repository;

  StockListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockListModel>>> call(
      ParamsGetListStock params) async {
    try {
      final list = await repository.getListStock();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStock {}
