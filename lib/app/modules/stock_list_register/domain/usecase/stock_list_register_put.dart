import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:dartz/dartz.dart';

class StockListRegisterPut implements UseCase<String, PutStockParams> {
  final StockListRepository repository;

  StockListRegisterPut({required this.repository});

  @override
  Future<Either<Failure, String>> call(PutStockParams params) async {
    try {
      final response = await repository.put(model: params.stock);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutStockParams {
  final StockListModel stock;

  const PutStockParams({
    required this.stock,
  });
}
