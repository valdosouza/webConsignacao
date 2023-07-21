import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/cashier_balance_respository.dart';
import '../datasource/cashier_balance_datasource.dart';

class CashierBalanceRepositoryImpl implements CashierBalanceRepository {
  final CashierBalanceDataSource datasource;

  CashierBalanceRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CashierBalanceModel>> cashierBalanceGet(
      {required String date}) async {
    try {
      final model = await datasource.cashierBalanceGet(date: date);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
