import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_respository.dart';

class StockBalanceGetlist
    implements UseCase<StockBalanceModel, ParamsGetListStockBalance> {
  final StockBalanceRepository repository;

  StockBalanceGetlist({required this.repository});

  @override
  Future<Either<Failure, StockBalanceModel>> call(
      ParamsGetListStockBalance params) async {
    try {
      final list =
          await repository.getList(tbStockListId: params.tbStockListId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStockBalance {
  final int tbStockListId;
  const ParamsGetListStockBalance({required this.tbStockListId});
}
