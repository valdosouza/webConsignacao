import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/datasource/stock_balance_customer_datasource.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_customer_respository.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';
import 'package:dartz/dartz.dart';

class StockBalanceCustomerRepositoryImpl
    implements StockBalanceCustomerRepository {
  final StockBalanceCustomerDataSource datasource;

  StockBalanceCustomerRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, StockBalanceModel>> getList() async {
    try {
      final list = await datasource.getlist();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockBalanceByProductModel>> customerAllByProducts(
      {required ParamsGetCustomerAllByProducts params}) async {
    try {
      final list = await datasource.customerAllByProducts(params: params);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
