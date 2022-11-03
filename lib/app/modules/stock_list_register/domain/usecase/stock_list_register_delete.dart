import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockListRegisterDelete implements UseCase<String, DeleteStockParams> {
  final StockListRepository repository;

  StockListRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeleteStockParams params) async {
    try {
      final list = await repository.delete(stockId: params.stockId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeleteStockParams extends Equatable {
  final int stockId;

  const DeleteStockParams({
    required this.stockId,
  });

  @override
  List<Object?> get props => [stockId];
}
