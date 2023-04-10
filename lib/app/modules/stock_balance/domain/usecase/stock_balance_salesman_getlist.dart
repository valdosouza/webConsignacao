import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_salesman_respository.dart';
import 'package:dartz/dartz.dart';

class StockBalanceSalesmanGetlist
    implements UseCase<StockBalanceModel, ParamsGetlistStockBalanceModel> {
  final StockBalanceSalesmanRepository repository;

  StockBalanceSalesmanGetlist({required this.repository});

  @override
  Future<Either<Failure, StockBalanceModel>> call(
      ParamsGetlistStockBalanceModel params) async {
    try {
      final list = await repository.getList(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
