import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:dartz/dartz.dart';

abstract class CashierBalanceRepository {
  Future<Either<Failure, CashierBalanceModel>> cashierBalanceGet(
      {required String date});
}
