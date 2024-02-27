import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';
import 'package:dartz/dartz.dart';

abstract class StockBalanceCustomerRepository {
  Future<Either<Failure, StockBalanceModel>> getList();

  Future<Either<Failure, StockBalanceByProductModel>> customerAllByProducts(
      {required ParamsGetCustomerAllByProducts params});
}
