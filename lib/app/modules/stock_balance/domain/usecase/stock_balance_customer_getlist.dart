import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_customer_respository.dart';
import 'package:dartz/dartz.dart';

class StockBalanceCustomerGetlist
    implements
        UseCase<List<StockBalanceModel>, ParamsGetListStockBalanceCustomer> {
  final StockBalanceCustomerRepository repository;

  StockBalanceCustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockBalanceModel>>> call(
      ParamsGetListStockBalanceCustomer params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStockBalanceCustomer {
  const ParamsGetListStockBalanceCustomer();
}
