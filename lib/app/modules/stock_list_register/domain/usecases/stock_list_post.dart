import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repositories/stock_list_repository.dart';
import 'package:dartz/dartz.dart';

class StockListPost implements UseCase<StockListModel, AddStockParams> {
  final StockListRepository repository;

  StockListPost({required this.repository});

  @override
  Future<Either<Failure, StockListModel>> call(AddStockParams params) async {
    try {
      final response = await repository.post(model: params.stock);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class AddStockParams {
  final StockListModel stock;

  const AddStockParams({
    required this.stock,
  });
}
