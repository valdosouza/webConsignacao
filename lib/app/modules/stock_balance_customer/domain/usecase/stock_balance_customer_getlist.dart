import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance_customer/domain/repository/stock_balance_customer_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockBalanceCustomerGetlist
    implements UseCase<List<StockBalanceModel>, ParamsGetListStockBalance> {
  final StockBalanceCustomerRepository repository;

  StockBalanceCustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockBalanceModel>>> call(ParamsGetListStockBalance params) async {
    try {
      final list =
          await repository.getList(id: params.institutionId, salesmanId: params.salesmanId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStockBalance extends Equatable {
  final int institutionId;
  final int salesmanId;

  const ParamsGetListStockBalance({
    required this.institutionId,
    required this.salesmanId
  });

  @override
  List<Object?> get props => [institutionId, salesmanId];
}
