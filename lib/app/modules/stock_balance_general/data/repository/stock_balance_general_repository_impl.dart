import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_general/data/datasource/stock_balance_general_datasource.dart';
import 'package:appweb/app/modules/stock_balance_general/domain/repository/stock_balance_general_respository.dart';
import 'package:dartz/dartz.dart';

class StockBalanceGeneralRepositoryImpl implements StockBalanceGeneralRepository {
  final StockBalanceGeneralDataSource datasource;

  StockBalanceGeneralRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<StockBalanceModel>>> getList({required int id, required int salesmanId}) async {
    try {
      final list = await datasource.getlist(id: id, salesmanId: salesmanId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
