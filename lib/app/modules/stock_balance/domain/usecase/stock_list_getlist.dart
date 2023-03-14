import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_respository.dart';

class StockListGetlist
    implements UseCase<List<StockListModel>, ParamsGetListStock> {
  final StockBalancerRepository repository;

  StockListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockListModel>>> call(
      ParamsGetListStock params) async {
    try {
      final list = await repository.getListStock();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStock {
  const ParamsGetListStock();
}
