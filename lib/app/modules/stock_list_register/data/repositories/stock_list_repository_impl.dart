import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/stock_list_register/data/datasource/remote/ownapi/stock_list_datasource.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repositories/stock_list_repository.dart';
import 'package:dartz/dartz.dart';

class StockListRepositoryImpl implements StockListRepository {
  final StockListDatasource datasource;
  //final NetworkInfo networkinfo;
  StockListRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<StockListModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockListModel>> post(
      {required StockListModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int stockId}) async {
    try {
      final result = await datasource.delete(id: stockId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> put({required StockListModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
