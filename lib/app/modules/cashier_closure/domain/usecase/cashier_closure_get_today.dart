import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';

class CashierClosureGet implements UseCase<ClosureModel, ParamsGet> {
  CashierClosureGet({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, ClosureModel>> call(ParamsGet params) async {
    try {
      final closure = await repository.getClosure(
        date: params.date,
      );
      return closure;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGet {
  final String date;

  const ParamsGet({required this.date});
}
