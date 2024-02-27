import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class StockBalanceRepository {
  Future<Either<Failure, List<StockListModel>>> getListStock();
  Future<Either<Failure, StockBalanceModel>> getList(
      {required int tbStockListId});
}
