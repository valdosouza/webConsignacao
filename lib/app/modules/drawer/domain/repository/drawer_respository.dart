import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';

import 'package:dartz/dartz.dart';

abstract class DrawertRepository {
  Future<Either<Failure, CashierStatusModel>> cashierIsOpen();
  Future<Either<Failure, OrderLoadCardMainModel>> orderLoadExist();
}
