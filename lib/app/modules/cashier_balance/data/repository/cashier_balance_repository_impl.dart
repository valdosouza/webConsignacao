import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/cashier_balance_entity.dart';
import '../../domain/repository/cashier_balance_respository.dart';
import '../datasource/cashier_balance_datasource.dart';

class CashierBalanceRepositoryImpl implements CashierBalanceRepository {
  final CashierBalanceDataSource datasource;

  CashierBalanceRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CashierBalanceEntity>> getCashierBalance(
      {required int id, required String date, required int userId}) async {
    try {
      final model = await datasource.getCashierBalance(id: id, date: date, userId: userId);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
