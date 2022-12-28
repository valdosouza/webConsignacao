import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:dartz/dartz.dart';

abstract class StockBalanceGeneralRepository {
  Future<Either<Failure, List<StockBalanceModel>>> getList(
      {required int id, required int salesmanId});
}
