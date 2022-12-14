import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_general_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockBalanceGeneralGetlist
    implements
        UseCase<List<StockBalanceModel>, ParamsGetListStockBalanceGeneral> {
  final StockBalanceGeneralRepository repository;

  StockBalanceGeneralGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockBalanceModel>>> call(
      ParamsGetListStockBalanceGeneral params) async {
    try {
      final list = await repository.getList(
          id: params.institutionId, tbSalesmanId: params.tbSalesmanId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStockBalanceGeneral extends Equatable {
  final int institutionId;
  final int tbSalesmanId;

  const ParamsGetListStockBalanceGeneral(
      {required this.institutionId, required this.tbSalesmanId});

  @override
  List<Object?> get props => [institutionId, tbSalesmanId];
}
