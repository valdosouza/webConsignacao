import 'package:appweb/app/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../entity/cashier_balance_entity.dart';

abstract class CashierBalanceRepository {
  Future<Either<Failure, CashierBalanceEntity>> getCashierBalance(
      {required int id, required String date, required int userId});
}
