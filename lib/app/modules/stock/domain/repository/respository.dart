import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';

import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, CashierStatusModel>> cashierIsOpen();
}
