import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';

class StockListRegisterDelete
    implements UseCase<String, ParamsStockListDelete> {
  final StockListRepository repository;

  StockListRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsStockListDelete params) async {
    try {
      final list = await repository.delete(stockId: params.stockId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsStockListDelete {
  int stockId;
  ParamsStockListDelete(this.stockId);
}
