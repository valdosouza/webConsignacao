import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:dartz/dartz.dart';

class StockListRegisterGetlist
    implements UseCase<List<StockListModel>, ParamsStockListRegister> {
  final StockListRepository repository;

  StockListRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockListModel>>> call(
      ParamsStockListRegister params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsStockListRegister {
  const ParamsStockListRegister();
}
