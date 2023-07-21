import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:dartz/dartz.dart';

class StockListRegisterPost
    implements UseCase<StockListModel, ParamsStockListPost> {
  final StockListRepository repository;

  StockListRegisterPost({required this.repository});

  @override
  Future<Either<Failure, StockListModel>> call(
      ParamsStockListPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsStockListPost {
  StockListModel model;
  ParamsStockListPost({required this.model});
}
