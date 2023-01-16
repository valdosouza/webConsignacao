import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';

class CashierClosureGetPreviously
    implements
        UseCase<List<CashierClosurePreviouslyModel>, ParamsGetPreviously> {
  CashierClosureGetPreviously({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, List<CashierClosurePreviouslyModel>>> call(
      ParamsGetPreviously params) async {
    try {
      final list = await repository.closurePreviously();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetPreviously {
  const ParamsGetPreviously();
}
