import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_salesman_datasource.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_salesman_respository.dart';
import 'package:dartz/dartz.dart';

class StockBalanceSalesmanRepositoryImpl
    implements StockBalanceSalesmanRepository {
  final StockBalanceSalesmanDataSource datasource;

  StockBalanceSalesmanRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<StockBalanceModel>>> getList() async {
    try {
      final list = await datasource.getlist();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
