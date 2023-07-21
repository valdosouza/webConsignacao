import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';
import 'package:dartz/dartz.dart';

abstract class CashierClosureRepository {
  Future<Either<Failure, ClosureModel>> getClosure({
    required String date,
  });
  Future<Either<Failure, ClosureModel>> getForClosure({
    required String date,
  });

  Future<Either<Failure, List<CashierClosurePreviouslyModel>>>
      closurePreviously();
  Future<Either<Failure, String>> postClosure(
      {required ParamsCashierClosurePost param});
  Future<Either<Failure, CashierStatusModel>> cashierClosureGetCurrentDate();
}
