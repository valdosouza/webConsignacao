import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_datasource.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_respository.dart';

import 'package:dartz/dartz.dart';

class StockBalanceRepositoryImpl implements StockBalancerRepository {
  final StockBalanceDataSource datasource;

  StockBalanceRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<StockListModel>>> getListStock() async {
    try {
      final list = await datasource.getListStock();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockBalanceModel>> getList(
      {required int tbStockListId}) async {
    try {
      final list = await datasource.getlist(tbStockListId: tbStockListId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
