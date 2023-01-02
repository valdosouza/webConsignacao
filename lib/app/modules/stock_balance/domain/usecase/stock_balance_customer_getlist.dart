import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/stock_balance/domain/repository/stock_balance_customer_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StockBalanceCustomerGetlist
    implements
        UseCase<List<StockBalanceModel>, ParamsGetListStockBalanceCustomer> {
  final StockBalanceCustomerRepository repository;

  StockBalanceCustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<StockBalanceModel>>> call(
      ParamsGetListStockBalanceCustomer params) async {
    try {
      final list = await repository.getList(
          tbInstitutionId: params.institutionId,
          tbSalesmanId: params.tbSalesmanId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListStockBalanceCustomer extends Equatable {
  final int institutionId;
  final int tbSalesmanId;

  const ParamsGetListStockBalanceCustomer(
      {required this.institutionId, required this.tbSalesmanId});

  @override
  List<Object?> get props => [institutionId, tbSalesmanId];
}
