import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class StockListRepository {
  Future<Either<Failure, List<StockListModel>>> getList();

  Future<Either<Failure, StockListModel>> post({required StockListModel model});
  Future<Either<Failure, String>> put({required StockListModel model});
  Future<Either<Failure, String>> delete({required int stockId});
}
