import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockListGetlist
    implements UseCase<List<StockListModel>, ParamsStockList> {
  final OrderProductionRegisterRepository repository;

  StockListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockListModel>>> call(ParamsStockList params) async {
    try {
      final list =
          await repository.getListStock(id: params.institutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsStockList extends Equatable {
  final int institutionId;

  const ParamsStockList({
    required this.institutionId,
  });

  @override
  List<Object?> get props => [institutionId];
}
