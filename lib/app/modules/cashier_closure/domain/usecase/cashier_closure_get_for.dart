import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';

class CashierClosureGetFor
    implements UseCase<ClosureModel, ParamsGetForClosure> {
  CashierClosureGetFor({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, ClosureModel>> call(ParamsGetForClosure params) async {
    try {
      final closure = await repository.getForClosure(
        date: params.date,
      );
      return closure;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetForClosure {
  final String date;

  const ParamsGetForClosure({required this.date});
}
