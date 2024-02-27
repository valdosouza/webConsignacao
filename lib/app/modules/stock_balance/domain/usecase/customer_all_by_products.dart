import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_customer_respository.dart';

class CustomerAllByProducts
    implements
        UseCase<StockBalanceByProductModel, ParamsGetCustomerAllByProducts> {
  final StockBalanceCustomerRepository repository;

  CustomerAllByProducts({required this.repository});

  @override
  Future<Either<Failure, StockBalanceByProductModel>> call(
      ParamsGetCustomerAllByProducts params) async {
    try {
      final list = await repository.customerAllByProducts(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCustomerAllByProducts {
  final int tbProductId;
  const ParamsGetCustomerAllByProducts({required this.tbProductId});
}
