import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:dartz/dartz.dart';

abstract class CashierClosureRepository {
  Future<Either<Failure, ClosureModel>> getClosure({
    required String date,
  });
  Future<Either<Failure, List<CashierClosurePreviouslyModel>>>
      closurePreviously();
}
