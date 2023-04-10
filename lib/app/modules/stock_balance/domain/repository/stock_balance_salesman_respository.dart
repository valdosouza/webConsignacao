import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';
import 'package:dartz/dartz.dart';

abstract class StockBalanceSalesmanRepository {
  Future<Either<Failure, StockBalanceModel>> getList(
      {required ParamsGetlistStockBalanceModel params});
}
